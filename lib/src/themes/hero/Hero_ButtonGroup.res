open ReactNative.Style
open Hero_Variables

let _TEXT_FONT_SIZE = _HEADER_4
let _BUTTON_MARGIN = _SMALL_SIZE
let _BUTTON_PADDING_VERTICAL = _MEDIUM_SIZE
let _BUTTON_PADDING_HORIZONTAL = _MEDIUM_SIZE
let _BUTTON_HEIGHT = _TEXT_FONT_SIZE +. _BUTTON_PADDING_VERTICAL *. 2.0
let _BUTTON_BORDER_RADIUS = _SMALL_SIZE
let _ACTIVE_TEXT_COLOR = _INVERTED_TEXT_COLOR
let _ACTIVE_BACKGROUND_COLOR = _DARK_PRIMARY_COLOR
let _ACTIVE_BORDER_COLOR = _DARK_PRIMARY_COLOR
let _INACTIVE_TEXT_COLOR = _MUTED_TEXT_COLOR
let _INACTIVE_BACKGROUND_COLOR = "transparent"
let _INACTIVE_BORDER_COLOR = _MUTED_TEXT_COLOR

let styles: Js.t<'a> = {
  "group": style(
    ~display=#flex,
    ~flexDirection=#row,
    ~flexWrap=#wrap,
    ~justifyContent=#spaceBetween,
    ~margin=-._BUTTON_MARGIN->dp,
    (),
  ),
  "wrapper": style(~display=#flex, ~flexGrow=1.0, ()),
  "button": style(
    ~display=#flex,
    ~alignItems=#center,
    ~justifyContent=#center,
    ~height=_BUTTON_HEIGHT->dp,
    ~minWidth=_BUTTON_HEIGHT->dp,
    ~margin=_BUTTON_MARGIN->dp,
    ~paddingHorizontal=_BUTTON_PADDING_HORIZONTAL->dp,
    ~borderWidth=ReactNative.StyleSheet.hairlineWidth,
    ~borderRadius=_BUTTON_BORDER_RADIUS,
    (),
  ),
  "text": style(
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_TEXT_FONT_SIZE,
    ~lineHeight=_TEXT_FONT_SIZE,
    (),
  ),
  "activeButton": style(
    ~borderColor=_ACTIVE_BORDER_COLOR,
    ~backgroundColor=_ACTIVE_BACKGROUND_COLOR,
    (),
  ),
  "activeText": style(~color=_ACTIVE_TEXT_COLOR, ()),
  "inactiveButton": style(
    ~borderColor=_INACTIVE_BORDER_COLOR,
    ~backgroundColor=_INACTIVE_BACKGROUND_COLOR,
    (),
  ),
  "inactiveText": style(~color=_INACTIVE_TEXT_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
