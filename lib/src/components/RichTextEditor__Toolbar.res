open ReactNative

let emitter = RichTextEditor__Event.emitter

module ToolbarButton = {
  @react.component
  let make = (~icon, ~onPress, ~theme=Hero_Theme.default) =>
    <TouchableOpacity onPress style={theme["richTextEditor"]["toolbarButton"]}>
      <Icon icon />
    </TouchableOpacity>

  let make = Helpers.injectTheme(make)
}

type buttonConfig = {
  icon: string,
  eventName: string,
}

let buttonConfigs: Js.Dict.t<buttonConfig> = Js.Dict.fromList(list{
  ("|", {icon: "", eventName: ""}),
  ("bold", {icon: "format_bold", eventName: "bold"}),
  ("italic", {icon: "format_italic", eventName: "italic"}),
  ("underline", {icon: "format_underlined", eventName: "underline"}),
  ("bulletedList", {icon: "format_list_bulleted", eventName: "bulleted-list"}),
  ("numberedList", {icon: "format_list_numbered", eventName: "numbered-list"}),
  ("headingOne", {icon: "looks_one", eventName: "heading-one"}),
  ("headingTwo", {icon: "looks_two", eventName: "heading-two"}),
})

let defaultButtons = [
  "bold",
  "italic",
  "underline",
  "|",
  "bulletedList",
  "numberedList",
  "|",
  "headingOne",
  "headingTwo",
]

@react.component
let make = (~name: string, ~buttons: array<string>=defaultButtons, ~theme=Hero_Theme.default) => {
  let (show, setShow) = React.useState(() => false)

  let normalizeEventName = event => j`$name/$event`

  React.useEffect0(() => {
    let removeFocusListener = Events.on'(emitter, normalizeEventName("editor-focus"), _ =>
      setShow(_ => true)
    )

    let removeBlurListener = Events.on'(emitter, normalizeEventName("editor-blur"), _ =>
      setShow(_ => false)
    )

    Some(
      () => {
        removeFocusListener()
        removeBlurListener()
      },
    )
  })

  let toolbarButtons = React.useMemo0(() =>
    buttons
    |> Js.Array.map(x =>
      switch x {
      | "|" => <View style={theme["richTextEditor"]["separator"]} />
      | button =>
        button
        |> Js.Dict.get(buttonConfigs)
        |> Js.Option.map((. config) =>
          <ToolbarButton
            icon=config.icon
            onPress={_ => Events.emit(emitter, normalizeEventName(config.eventName), None)}
          />
        )
        |> Js.Option.getWithDefault(React.null)
      }
    )
    |> React.array
  )

  show ? <View style={theme["richTextEditor"]["toolbar"]}> toolbarButtons </View> : React.null
}

let default = Helpers.injectTheme(make)
