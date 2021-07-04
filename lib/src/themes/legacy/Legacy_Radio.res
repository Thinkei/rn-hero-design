open ReactNative.Style
open Legacy_Variables

let _WRAPPER_VERTICAL_MARGIN = _MEDIUM_SIZE
let _WRAPPER_VERTICAL_PADDING = _SMALL_SIZE
let _LABEL_HORIZONTAL_MARGIN = _SMALL_SIZE
let _LABEL_FONT_SIZE = _HEADER_4
let _ICON_ACTIVE_COLOR = _PRIMARY_COLOR
let _ICON_INACTIVE_COLOR = _DISABLED_BACKGROUND_COLOR

let styles: Js.t<'a> = {
  "wrapper": style(
    ~flexDirection=#row,
    ~alignItems=#center,
    ~paddingVertical=_WRAPPER_VERTICAL_PADDING->dp,
    ~marginBottom=_WRAPPER_VERTICAL_MARGIN->dp,
    (),
  ),
  "label": style(
    ~marginLeft=_LABEL_HORIZONTAL_MARGIN->dp,
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_LABEL_FONT_SIZE,
    (),
  ),
  "activeIcon": style(~color=_ICON_ACTIVE_COLOR, ()),
  "inactiveIcon": style(~color=_ICON_INACTIVE_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
