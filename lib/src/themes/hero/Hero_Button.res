open ReactNative.Style
open Hero_Variables

let _TEXT_FONT_SIZE = _HEADER_4
let _WRAPPER_PADDING_VERTICAL = _MEDIUM_SIZE
let _WRAPPER_PADDING_HORIZONTAL = _MEDIUM_SIZE
let _WRAPPER_HEIGHT = _TEXT_FONT_SIZE +. _WRAPPER_PADDING_VERTICAL *. 2.0
let _WRAPPER_BORDER_RADIUS = _WRAPPER_HEIGHT *. 0.5
let _FILLED_TEXT_COLOR = _INVERTED_TEXT_COLOR
let _FILLED_BACKGROUND_COLOR = _PRIMARY_COLOR
let _OUTLINED_TEXT_COLOR = _PRIMARY_COLOR
let _OUTLINED_BORDER_COLOR = _PRIMARY_COLOR
let _DISABLED_TEXT_COLOR = _INVERTED_TEXT_COLOR
let _DISABLED_BACKGROUND_COLOR = Hero_Variables._DISABLED_BACKGROUND_COLOR

let styles: Js.t<'a> = {
  "wrapper": style(
    ~display=#flex,
    ~alignItems=#center,
    ~justifyContent=#center,
    ~height=_WRAPPER_HEIGHT->dp,
    ~paddingHorizontal=_WRAPPER_PADDING_HORIZONTAL->dp,
    ~borderRadius=_WRAPPER_BORDER_RADIUS,
    (),
  ),
  "text": style(
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_TEXT_FONT_SIZE,
    ~lineHeight=_TEXT_FONT_SIZE,
    (),
  ),
  "filledWrapper": style(~backgroundColor=_FILLED_BACKGROUND_COLOR, ()),
  "filledText": style(~color=_FILLED_TEXT_COLOR, ()),
  "filledLoadingIndicator": style(~color=_FILLED_TEXT_COLOR, ()),
  "outlinedWrapper": style(
    ~borderWidth=1.2,
    ~borderColor=_OUTLINED_BORDER_COLOR,
    ~backgroundColor="transparent",
    (),
  ),
  "outlinedText": style(~fontWeight=#_500, ~color=_OUTLINED_TEXT_COLOR, ()),
  "outlinedLoadingIndicator": style(~color=_OUTLINED_TEXT_COLOR, ()),
  "disabledWrapper": style(~borderWidth=0.0, ~backgroundColor=_DISABLED_BACKGROUND_COLOR, ()),
  "disabledText": style(~color=_DISABLED_TEXT_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
