open ReactNative.Style
open Legacy_Variables

let _CONTAINER_PADDING = _MEDIUM_SIZE

let styles: Js.t<'a> = {
  "container": style(~padding=_CONTAINER_PADDING->dp, ()),
  "fluid": style(~flex=1.0, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
