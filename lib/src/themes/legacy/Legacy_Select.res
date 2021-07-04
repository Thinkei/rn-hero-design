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
let _OPTION_PADDING_VERTICAL = _MEDIUM_SIZE
let _OPTION_PADDING_HORIZONTAL = _MEDIUM_SIZE
let _OPTION_TEXT_FONT_SIZE = _HEADER_4
let _OPTION_TEXT_COLOR = _TEXT_COLOR
let _SELECTED_OPTION_TEXT_COLOR = _PRIMARY_COLOR

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
  /* Select uses system font */
  "actionText": style(~fontSize=_ACTION_TEXT_FONT_SIZE, ~color=_ACTION_TEXT_COLOR, ()),
  "overlay": style(
    ~flex=1.0,
    ~alignItems=#center,
    ~justifyContent=#center,
    ~backgroundColor="rgba(0,0,0,0.5)",
    (),
  ),
  "dialog": style(
    ~width=80.0->pct,
    ~maxHeight=70.0->pct,
    ~backgroundColor=_WHITE,
    ~borderRadius=2.0,
    ~elevation=10.0,
    (),
  ),
  "optionWrapper": style(
    ~paddingVertical=_OPTION_PADDING_VERTICAL->dp,
    ~paddingHorizontal=_OPTION_PADDING_HORIZONTAL->dp,
    (),
  ),
  "optionText": style(~fontSize=_OPTION_TEXT_FONT_SIZE, ~color=_OPTION_TEXT_COLOR, ()),
  "selectedOptionText": style(~fontWeight=#_400, ~color=_SELECTED_OPTION_TEXT_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
