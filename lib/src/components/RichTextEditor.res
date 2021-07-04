open ReactNative

@module("./heroEditorApp") external heroEditorApp: string = "default"

@get external getPaddingProperty: Style.t => Style.size = "padding"

@get external getFontSizeProperty: Style.t => float = "fontSize"

let isAndroid = Helpers.Platform.isAndroid

type editorLayout = {
  width: float,
  height: float,
}

let getSize = (dict, size) =>
  dict->Js.Dict.get(size)->Belt.Option.flatMap(Js.Json.decodeNumber)->Belt.Option.getExn

let emitter = RichTextEditor__Event.emitter

let noop = _ => ()

let isEmpty = str => String.length(str) == 0

let emptyStyle = Style.style()

let defaultValue = Js.Json.parseExn(` [{ "type": "paragraph", "children": [{ "text": "" }] }] `)

@react.component
let make = (
  ~name: string,
  ~placeholder: string="",
  ~initialValue: Js.Json.t=defaultValue,
  ~onChange=noop,
  ~onCursorChange=noop,
  ~error="",
  ~style=emptyStyle,
  ~wrapperStyle=emptyStyle,
  ~errorStyle=emptyStyle,
  ~theme=Hero_Theme.default,
) => {
  module Option = Belt.Option
  module Json = Js.Json
  module Dict = Js.Dict

  let webview = React.useRef(Js.Null.empty)
  let (webviewHeight, setWebviewHeight) = React.useState(_ => None)

  let normalizeEventName = event => j`$name/$event`

  let postMessageToWebview = message =>
    webview.current->Js.Null.getUnsafe->RNWebView.postMessage(message)

  let html = React.useMemo0(() => {
    let initialValue = initialValue->Json.stringify
    let padding = theme["richTextEditor"]["editor"]->getPaddingProperty
    let fontSize = theme["richTextEditor"]["editor"]->getFontSizeProperty

    j`
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
          <style>
            body {
              margin: 0;
            }
          </style>
        </head>
        <body>
          <div id="root"></div>
          <script>
            window.__editorConfigs = {
              placeholder: "$placeholder",
              initialValue: $initialValue,
              isAndroid: $isAndroid,
              autoFocus: true,
              style: {
                padding: 0,
                paddingTop: $padding,
                paddingBottom: $padding,
                fontSize: $fontSize
              }
            };
            $heroEditorApp
          </script>
        </body>
      </html>
      `
  })

  /* Forward events from Toolbar and MentionList to webview */
  React.useEffect0(() => {
    let removeBoldListener = Events.on'(emitter, normalizeEventName("bold"), _ =>
      postMessageToWebview(RNWebView.message(~type_="@hero-editor/webview/bold", ~data=Json.null))
    )

    let removeItalicListener = Events.on'(emitter, normalizeEventName("italic"), _ =>
      postMessageToWebview(RNWebView.message(~type_="@hero-editor/webview/italic", ~data=Json.null))
    )

    let removeUnderlineListener = Events.on'(emitter, normalizeEventName("underline"), _ =>
      postMessageToWebview(
        RNWebView.message(~type_="@hero-editor/webview/underline", ~data=Json.null),
      )
    )

    let removeBulletedListListener = Events.on'(emitter, normalizeEventName("bulleted-list"), _ =>
      postMessageToWebview(
        RNWebView.message(~type_="@hero-editor/webview/bulleted-list", ~data=Json.null),
      )
    )

    let removeNumberedListListener = Events.on'(emitter, normalizeEventName("numbered-list"), _ =>
      postMessageToWebview(
        RNWebView.message(~type_="@hero-editor/webview/numbered-list", ~data=Json.null),
      )
    )

    let removeHeadingOneListener = Events.on'(emitter, normalizeEventName("heading-one"), _ =>
      postMessageToWebview(
        RNWebView.message(~type_="@hero-editor/webview/heading-one", ~data=Json.null),
      )
    )

    let removeHeadingTwoListener = Events.on'(emitter, normalizeEventName("heading-two"), _ =>
      postMessageToWebview(
        RNWebView.message(~type_="@hero-editor/webview/heading-two", ~data=Json.null),
      )
    )

    let removeMentionApplyListener = Events.on'(
      emitter,
      normalizeEventName("mention-apply"),
      data =>
        postMessageToWebview(
          RNWebView.message(~type_="@hero-editor/webview/mention-apply", ~data=Option.getExn(data)),
        ),
    )

    Some(
      () => {
        removeBoldListener()
        removeItalicListener()
        removeUnderlineListener()
        removeBulletedListListener()
        removeNumberedListListener()
        removeMentionApplyListener()
        removeHeadingOneListener()
        removeHeadingTwoListener()
      },
    )
  })

  /* Handle events from webview */
  let onMessage = React.useCallback0(event => {
    let message = event["nativeEvent"]["data"]->Json.parseExn->Json.decodeObject->Option.getExn

    let messageType = message->Dict.get("type")->Option.flatMap(Json.decodeString)->Option.getExn

    let messageData = message->Dict.get("data")->Option.getExn

    switch messageType {
    | "@hero-editor/webview/editor-focus" =>
      Events.emit(emitter, normalizeEventName("editor-focus"), None)

    | "@hero-editor/webview/editor-blur" =>
      Events.emit(emitter, normalizeEventName("editor-blur"), None)

    | "@hero-editor/webview/mention-search" =>
      Events.emit(emitter, normalizeEventName("mention-search"), Some(messageData))

    | "@hero-editor/webview/editor-change" =>
      let value: Json.t =
        messageData
        ->Json.decodeObject
        ->Option.flatMap(data => Dict.get(data, "value"))
        ->Option.getExn

      onChange(value)

    | "@hero-editor/webview/cursor-change" => onCursorChange(messageData)

    | "@hero-editor/webview/editor-layout" =>
      let editorLayout =
        messageData
        ->Json.decodeObject
        ->Option.map(data => {
          width: getSize(data, "width"),
          height: getSize(data, "height"),
        })
        ->Option.getExn

      if editorLayout.height > 120.0 {
        setWebviewHeight(_ => Some(editorLayout.height->Style.dp))
      }

    | _ => ()
    }
  })

  <View style={StyleSheet.flatten([theme["richTextEditor"]["wrapper"], wrapperStyle])}>
    <RNWebView
      ref=webview
      originWhitelist=["*"]
      source={RNWebView.Source.html(~html, ())}
      onMessage
      scrollEnabled=false
      hideKeyboardAccessoryView=true
      keyboardDisplayRequiresUserAction=false
      style={StyleSheet.flatten([
        theme["richTextEditor"]["webview"],
        !isEmpty(error) ? theme["richTextEditor"]["errorWebview"] : emptyStyle,
        Style.style(~height=?webviewHeight, ()),
        style,
      ])}
    />
    {!isEmpty(error)
      ? <Text style={StyleSheet.flatten([theme["textInput"]["errorMessage"], errorStyle])}>
          {error->React.string}
        </Text>
      : React.null}
  </View>
}

@set
external setToolbarSubComponent: (React.component<'props1>, React.component<'props2>) => unit =
  "Toolbar"

@set
external setMentionListSubComponent: (React.component<'props1>, React.component<'props2>) => unit =
  "MentionList"

setToolbarSubComponent(make, RichTextEditor__Toolbar.make)

setMentionListSubComponent(make, RichTextEditor__MentionList.make)

let default = Helpers.injectTheme(make)
