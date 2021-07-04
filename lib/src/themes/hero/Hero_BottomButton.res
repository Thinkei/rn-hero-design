open ReactNative.Style
open Hero_Variables

let bottomInset = RNSafeAreaView.getInset(#bottom, None)

let _WRAPPER_MARGIN_HORIZONTAL = _MEDIUM_SIZE
let _WRAPPER_NO_HOME_BAR_MARGIN_BOTTOM = _MEDIUM_SIZE
let _WRAPPER_NO_HOME_BAR_PADDING_BOTTOM = 0.0
let _WRAPPER_WITH_HOME_BAR_MARGIN_BOTTOM = bottomInset
let _WRAPPER_WITH_HOME_BAR_PADDING_BOTTOM = 0.0
let _TEXT_FONT_SIZE = _HEADER_4
let _BUTTON_PADDING_VERTICAL = _MEDIUM_SIZE
let _BUTTON_PADDING_HORIZONTAL = _MEDIUM_SIZE
let _BUTTON_HEIGHT = _TEXT_FONT_SIZE +. _BUTTON_PADDING_VERTICAL *. 2.0
let _BUTTON_BORDER_RADIUS = _BUTTON_HEIGHT *. 0.5
let _FILLED_TEXT_COLOR = _INVERTED_TEXT_COLOR
let _FILLED_BACKGROUND_COLOR = _PRIMARY_COLOR
let _DISABLED_TEXT_COLOR = _INVERTED_TEXT_COLOR
let _DISABLED_BACKGROUND_COLOR = Hero_Variables._DISABLED_BACKGROUND_COLOR

let styles: Js.t<'a> = {
  "wrapper": style(
    ~marginHorizontal=_WRAPPER_MARGIN_HORIZONTAL->dp,
    ~backgroundColor=_FILLED_BACKGROUND_COLOR,
    ~borderRadius=_BUTTON_BORDER_RADIUS,
    (),
  ),
  "wrapperWithoutHomeBar": style(
    ~marginBottom=_WRAPPER_NO_HOME_BAR_MARGIN_BOTTOM->dp,
    ~paddingBottom=_WRAPPER_NO_HOME_BAR_PADDING_BOTTOM->dp,
    (),
  ),
  "wrapperWithHomeBar": style(
    ~marginBottom=_WRAPPER_WITH_HOME_BAR_MARGIN_BOTTOM->dp,
    ~paddingBottom=_WRAPPER_WITH_HOME_BAR_PADDING_BOTTOM->dp,
    (),
  ),
  "button": style(
    ~display=#flex,
    ~alignItems=#center,
    ~justifyContent=#center,
    ~height=_BUTTON_HEIGHT->dp,
    ~paddingHorizontal=_BUTTON_PADDING_HORIZONTAL->dp,
    (),
  ),
  "text": style(
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_TEXT_FONT_SIZE,
    ~lineHeight=_TEXT_FONT_SIZE,
    ~color=_FILLED_TEXT_COLOR,
    (),
  ),
  "loadingIndicator": style(~color=_FILLED_TEXT_COLOR, ()),
  "disabledWrapper": style(~backgroundColor=_DISABLED_BACKGROUND_COLOR, ()),
  "disabledText": style(~color=_DISABLED_TEXT_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
