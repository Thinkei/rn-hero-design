open ReactNative.Style
open Legacy_Variables

let _TAB_PADDING = _SMALL_SIZE
let _SELECTED_BORDER_COLOR = _PRIMARY_COLOR

let styles: Js.t<'a> = {
  "wrapper": style(~flex=1.0, ()),
  "navigator": style(~flexDirection=#row, ~alignItems=#stretch, ()),
  "tab": style(
    ~flex=1.0,
    ~flexDirection=#row,
    ~justifyContent=#center,
    ~alignItems=#center,
    ~padding=_TAB_PADDING->dp,
    ~borderBottomWidth=3.0,
    ~borderBottomColor="transparent",
    (),
  ),
  "content": style(~flex=1.0, ()),
  "selectedTab": style(~borderBottomColor=_SELECTED_BORDER_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
