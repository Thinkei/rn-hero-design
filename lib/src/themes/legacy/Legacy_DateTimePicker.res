open ReactNative.Style
open Legacy_Variables

let _WRAPPER_BACKGROUND_COLOR = _GREY_5
let _ACTIONS_BORDER_COLOR = _BORDER_COLOR
let _ACTION_TEXT_FONT_SIZE = _HEADER_4
let _ACTION_TEXT_LINE_HEIGHT = _HEADER_5
let _ACTION_TEXT_COLOR = _LINK_TEXT_COLOR
let _ACTION_PADDING_VERTICAL = _MEDIUM_SIZE
let _ACTION_PADDING_HORIZONTAL = _MEDIUM_SIZE
let _ACTION_HEIGHT = _ACTION_TEXT_LINE_HEIGHT +. _ACTION_PADDING_VERTICAL *. 2.0

let styles: Js.t<'a> = {
  "wrapper": style(~backgroundColor=_WRAPPER_BACKGROUND_COLOR, ()),
  "actions": style(
    ~flexDirection=#row,
    ~justifyContent=#flexEnd,
    ~borderBottomWidth=ReactNative.StyleSheet.hairlineWidth,
    ~borderBottomColor=_ACTIONS_BORDER_COLOR,
    (),
  ),
  "action": style(
    ~justifyContent=#center,
    ~height=_ACTION_HEIGHT->dp,
    ~paddingHorizontal=_ACTION_PADDING_HORIZONTAL->dp,
    (),
  ),
  /* DateTimePicker uses system font */
  "actionText": style(~fontSize=_ACTION_TEXT_FONT_SIZE, ~color=_ACTION_TEXT_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
