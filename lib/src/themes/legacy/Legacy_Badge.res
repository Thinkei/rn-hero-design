open ReactNative.Style
open Legacy_Variables

let _CONTENT_FONT_SIZE = _HEADER_5
let _WRAPPER_VERTICAL_PADDING = _SMALL_SIZE /. 2.0
let _WRAPPER_HORIZONTAL_PADDING = _SMALL_SIZE
let _WRAPPER_HEIGHT = _CONTENT_FONT_SIZE +. _WRAPPER_VERTICAL_PADDING *. 2.0

let styles: Js.t<'a> = {
  "wrapper": style(
    ~alignSelf=#flexStart,
    ~justifyContent=#center,
    ~height=_WRAPPER_HEIGHT->dp,
    ~minWidth=_WRAPPER_HEIGHT->dp,
    ~paddingHorizontal=_WRAPPER_HORIZONTAL_PADDING->dp,
    ~borderRadius=_WRAPPER_HEIGHT /. 2.0,
    (),
  ),
  "content": style(
    ~lineHeight=_CONTENT_FONT_SIZE,
    ~textTransform=#uppercase,
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
