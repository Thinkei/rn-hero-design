type element

@deriving(abstract)
type message = {
  @as("type")
  type_: string,
  data: Js.Json.t,
}

type event = {"nativeEvent": {"data": string}}

@send
external injectJavaScript: (element, string) => unit = "injectJavaScript"

let requestFocus = element =>
  injectJavaScript(
    element,
    j`
    window.document.getElementsByClassName('hero-editor--editable')[0].focus();
    `,
  )

let postMessage = (element, message) => {
  let message = message->Js.Json.stringifyAny->Belt.Option.getExn
  injectJavaScript(element, j`window.postMessage($message, '*');`)
}

module Source = {
  type t

  @obj
  external uri: (~uri: string=?, ~method: string=?, ~headers: 'a=?, ~body: string=?, unit) => t = ""

  @obj external html: (~html: string=?, ~baseUrl: string=?, unit) => t = ""
}

@react.component @module("react-native-webview")
external make: (
  ~ref: React.ref<Js.Null.t<element>>=?,
  ~originWhitelist: array<string>,
  ~source: Source.t,
  ~onMessage: event => unit,
  ~hideKeyboardAccessoryView: bool=?,
  ~keyboardDisplayRequiresUserAction: bool=?,
  ~scrollEnabled: bool=?,
  ~allowUniversalAccessFromFileURLs: bool=?,
  ~style: ReactNative.Style.t=?,
) => React.element = "WebView"
