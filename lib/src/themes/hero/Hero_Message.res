open ReactNative.Style
open Hero_Variables

let _WRAPPER_VERTICAL_PADDING = _SMALL_SIZE
let _WRAPPER_HORIZONTAL_PADDING = _MEDIUM_SIZE
let _CONTENT_FONT_SIZE = _HEADER_5

let styles: Js.t<'a> = {
  "wrapper": style(
    ~paddingVertical=_WRAPPER_VERTICAL_PADDING->dp,
    ~paddingHorizontal=_WRAPPER_HORIZONTAL_PADDING->dp,
    ~top=0.0->dp,
    ~left=0.0->dp,
    ~right=0.0->dp,
    (),
  ),
  "content": style(
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_CONTENT_FONT_SIZE,
    ~fontWeight=#_500,
    ~textAlign=#center,
    (),
  ),
  "errorWrapper": style(~backgroundColor=_ERROR_COLOR, ()),
  "errorContent": style(~color=_INVERTED_TEXT_COLOR, ()),
  "warningWrapper": style(~backgroundColor=_WARNING_COLOR, ()),
  "warningContent": style(~color=_INVERTED_TEXT_COLOR, ()),
  "successWrapper": style(~backgroundColor=_SUCCESS_COLOR, ()),
  "successContent": style(~color=_INVERTED_TEXT_COLOR, ()),
  "infoWrapper": style(~backgroundColor=_INFO_COLOR, ()),
  "infoContent": style(~color=_INVERTED_TEXT_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
