open ReactNative.Style
open Hero_Variables

let _COLOR = _TEXT_COLOR

let styles: Js.t<'a> = {"icon": style(~color=_COLOR, ())}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
