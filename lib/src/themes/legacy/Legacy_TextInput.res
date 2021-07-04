open ReactNative.Style
open Legacy_Variables

let _WRAPPER_MARGIN_VERTICAL = _MEDIUM_SIZE
let _LABEL_FONT_SIZE = _HEADER_5
let _LABEL_COLOR = _MUTED_TEXT_COLOR
let _PLACEHOLDER_COLOR = _MUTED_TEXT_COLOR
let _INPUT_FONT_SIZE = _HEADER_4
let _INPUT_PADDING_VERTICAL = _MEDIUM_SIZE
let _INPUT_HEIGHT = _INPUT_FONT_SIZE +. _INPUT_PADDING_VERTICAL *. 2.0
let _INPUT_BORDER_COLOR = _BORDER_COLOR
let _INPUT_COLOR = _TEXT_COLOR
let _ICON_MARGIN = _SMALL_SIZE
let _ICON_COLOR = _MUTED_TEXT_COLOR
let _ERROR_FONT_SIZE = _HEADER_5
let _ERROR_MARGIN_VERTICAL = _SMALL_SIZE
let _ERROR_COLOR = _DANGER_COLOR
let _ACTIVE_COLOR = _PRIMARY_COLOR

let styles: Js.t<'a> = {
  "wrapper": style(~marginBottom=_WRAPPER_MARGIN_VERTICAL->dp, ()),
  "label": style(
    ~height=_LABEL_FONT_SIZE->dp,
    ~lineHeight=_LABEL_FONT_SIZE,
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_LABEL_FONT_SIZE,
    ~fontWeight=#_500,
    ~color=_LABEL_COLOR,
    (),
  ),
  "placeholder": style(~color=_PLACEHOLDER_COLOR, ()),
  "textInput": style(
    ~flexDirection=#row,
    ~alignItems=#center,
    ~borderBottomWidth=0.8,
    ~borderBottomColor=_INPUT_BORDER_COLOR,
    (),
  ),
  "baseTextInput": style(
    ~flex=1.0,
    ~paddingTop=_INPUT_PADDING_VERTICAL->dp,
    ~paddingBottom=_INPUT_PADDING_VERTICAL->dp,
    ~textAlignVertical=#center,
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_INPUT_FONT_SIZE,
    ~color=_INPUT_COLOR,
    (),
  ),
  "icon": style(~height=_INPUT_HEIGHT->dp, ~marginLeft=_ICON_MARGIN->dp, ~color=_ICON_COLOR, ()),
  "errorMessage": style(
    ~minHeight=_ERROR_FONT_SIZE->dp,
    ~lineHeight=_ERROR_FONT_SIZE,
    ~marginTop=_ERROR_MARGIN_VERTICAL->dp,
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_ERROR_FONT_SIZE,
    ~fontWeight=#_500,
    ~color=_ERROR_COLOR,
    (),
  ),
  "errorLabel": style(~color=_ERROR_COLOR, ()),
  "errorTextInput": style(~borderBottomColor=_ERROR_COLOR, ()),
  "errorIcon": style(~color=_ERROR_COLOR, ()),
  "activeLabel": style(~color=_ACTIVE_COLOR, ()),
  "activeTextInput": style(~borderBottomColor=_ACTIVE_COLOR, ~borderBottomWidth=1.0, ()),
  "activeIcon": style(~color=_ACTIVE_COLOR, ()),
  "disabledBaseTextInput": style(~color=_DISABLED_TEXT_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
