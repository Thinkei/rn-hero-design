open ReactNative.Style
open Hero_Variables

let _TITLE_FONT_SIZE = _HEADER_4
let _TITLE_LINE_HEIGHT = _TITLE_FONT_SIZE *. 1.4
let _TITLE_COLOR = _TEXT_COLOR
let _SUBTITLE_FONT_SIZE = _HEADER_5
let _SUBTITLE_LINE_HEIGHT = _SUBTITLE_FONT_SIZE *. 1.4
let _SUBTITLE_COLOR = _MUTED_TEXT_COLOR
let _WRAPPER_PADDING_VERTICAL = _MEDIUM_SIZE
let _WRAPPER_PADDING_HORIZONTAL = _MEDIUM_SIZE
let _WRAPPER_HEIGHT =
  _TITLE_LINE_HEIGHT +. _SUBTITLE_LINE_HEIGHT +. _WRAPPER_PADDING_VERTICAL *. 2.0
let _WRAPPER_BORDER_COLOR = _BORDER_COLOR

let styles: Js.t<'a> = {
  "wrapper": style(
    ~display=#flex,
    ~flexDirection=#row,
    ~alignItems=#center,
    ~justifyContent=#spaceBetween,
    ~minHeight=_WRAPPER_HEIGHT->dp,
    ~paddingVertical=_WRAPPER_PADDING_VERTICAL->dp,
    ~paddingHorizontal=_WRAPPER_PADDING_HORIZONTAL->dp,
    ~borderBottomWidth=0.8,
    ~borderBottomColor=_WRAPPER_BORDER_COLOR,
    (),
  ),
  "title": style(
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_TITLE_FONT_SIZE,
    ~fontWeight=#_500,
    ~lineHeight=_TITLE_LINE_HEIGHT,
    ~color=_TITLE_COLOR,
    (),
  ),
  "subtitle": style(
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_SUBTITLE_FONT_SIZE,
    ~fontWeight=#_500,
    ~lineHeight=_SUBTITLE_LINE_HEIGHT,
    ~color=_SUBTITLE_COLOR,
    (),
  ),
  "contentWrapper": style(~flex=1.0, ~flexDirection=#row, ~alignItems=#center, ()),
  "textWrapper": style(~flex=1.0, ~flexDirection=#row, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
