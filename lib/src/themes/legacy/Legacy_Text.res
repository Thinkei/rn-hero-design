open ReactNative.Style
open Legacy_Variables

let _COLOR = _TEXT_COLOR
let _FONT_SIZE = _HEADER_4
let _H1_FONT_SIZE = _HEADER_1
let _H2_FONT_SIZE = _HEADER_2
let _H3_FONT_SIZE = _HEADER_3
let _H4_FONT_SIZE = _HEADER_4
let _H5_FONT_SIZE = _HEADER_5

let styles: Js.t<'a> = {
  "text": style(~fontFamily=?_FONT_FAMILY, ~fontSize=_FONT_SIZE, ~color=_COLOR, ()),
  "h1": style(~fontSize=_H1_FONT_SIZE, ()),
  "h2": style(~fontSize=_H2_FONT_SIZE, ()),
  "h3": style(~fontSize=_H3_FONT_SIZE, ()),
  "h4": style(~fontSize=_H4_FONT_SIZE, ()),
  "h5": style(~fontSize=_H5_FONT_SIZE, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
