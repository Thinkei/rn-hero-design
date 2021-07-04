open ReactNative.Style
open Legacy_Variables

let _WRAPPER_MARGIN_VERTICAL = _MEDIUM_SIZE
let _TEXT_FONT_SIZE = _HEADER_4
let _TEXT_COLOR = Hero_Variables._TEXT_COLOR
let _HIGHLIGHT_TEXT_COLOR = _GREY_4
let _SUGGESTION_WRAPPER_MARGIN = -4.0

let styles: Js.t<'a> = {
  "wrapper": style(~marginBottom=_WRAPPER_MARGIN_VERTICAL->dp, ()),
  "text": style(~fontFamily=?_FONT_FAMILY, ~fontSize=_TEXT_FONT_SIZE, ~color=_TEXT_COLOR, ()),
  "disabledText": style(~color=_DISABLED_TEXT_COLOR, ()),
  "highlightText": style(~backgroundColor=_HIGHLIGHT_TEXT_COLOR, ~borderRadius=2.0, ()),
  "suggestionWrapper": style(
    ~marginTop=_SUGGESTION_WRAPPER_MARGIN->dp,
    ~backgroundColor=_WHITE,
    ~borderRadius=4.0,
    ~shadowColor=_BLACK,
    ~shadowOffset=offset(~height=2.0, ~width=0.0),
    ~shadowOpacity=0.4,
    ~shadowRadius=4.0,
    ~elevation=10.0,
    (),
  ),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
