open ReactNative.Style
open Hero_Variables

let _WRAPPER_BORDER_COLOR = _PRIMARY_COLOR
let _TITLE_COLOR = _PRIMARY_COLOR

/* This will fit the ListItem */
let _WRAPPER_MEDIUM_SIZE = _LARGE_SIZE *. 2.0
let _WRAPPER_MEDIUM_RADIUS = _WRAPPER_MEDIUM_SIZE /. 2.0
let _TITLE_MEDIUM_FONT_SIZE = _HEADER_2
let _TITLE_MEDIUM_FONT_WEIGHT = #_300

let _WRAPPER_LARGE_SIZE = _LARGE_SIZE *. 4.0
let _WRAPPER_LARGE_RADIUS = _WRAPPER_LARGE_SIZE /. 2.0
let _TITLE_LARGE_FONT_SIZE = _HEADER_2 *. 2.0
let _TITLE_LARGE_FONT_WEIGHT = #_200

let _WRAPPER_SMALL_SIZE = _LARGE_SIZE *. 1.0
let _WRAPPER_SMALL_RADIUS = _WRAPPER_SMALL_SIZE /. 2.0
let _TITLE_SMALL_FONT_SIZE = _HEADER_2 /. 2.0
let _TITLE_SMALL_FONT_WEIGHT = #_400

let styles: Js.t<'a> = {
  "wrapper": style(),
  "titleWrapper": style(
    ~position=#absolute,
    ~top=0.0->dp,
    ~left=0.0->dp,
    ~alignItems=#center,
    ~justifyContent=#center,
    ~borderColor=_WRAPPER_BORDER_COLOR,
    (),
  ),
  "title": style(~fontFamily=?_FONT_FAMILY, ~color=_TITLE_COLOR, ()),
  "image": style(~position=#absolute, ~top=0.0->dp, ~left=0.0->dp, ()),
  "mediumWrapper": style(~width=_WRAPPER_MEDIUM_SIZE->dp, ~height=_WRAPPER_MEDIUM_SIZE->dp, ()),
  "mediumTitleWrapper": style(
    ~width=_WRAPPER_MEDIUM_SIZE->dp,
    ~height=_WRAPPER_MEDIUM_SIZE->dp,
    ~borderWidth=1.2,
    ~borderRadius=_WRAPPER_MEDIUM_RADIUS,
    (),
  ),
  "mediumTitle": style(
    ~fontSize=_TITLE_MEDIUM_FONT_SIZE,
    ~fontWeight=_TITLE_MEDIUM_FONT_WEIGHT,
    (),
  ),
  "mediumImage": style(
    ~width=_WRAPPER_MEDIUM_SIZE->dp,
    ~height=_WRAPPER_MEDIUM_SIZE->dp,
    ~borderRadius=_WRAPPER_MEDIUM_RADIUS,
    (),
  ),
  "largeWrapper": style(~width=_WRAPPER_LARGE_SIZE->dp, ~height=_WRAPPER_LARGE_SIZE->dp, ()),
  "largeTitleWrapper": style(
    ~width=_WRAPPER_LARGE_SIZE->dp,
    ~height=_WRAPPER_LARGE_SIZE->dp,
    ~borderWidth=1.5,
    ~borderRadius=_WRAPPER_LARGE_RADIUS,
    (),
  ),
  "largeTitle": style(~fontSize=_TITLE_LARGE_FONT_SIZE, ~fontWeight=_TITLE_LARGE_FONT_WEIGHT, ()),
  "largeImage": style(
    ~width=_WRAPPER_LARGE_SIZE->dp,
    ~height=_WRAPPER_LARGE_SIZE->dp,
    ~borderRadius=_WRAPPER_LARGE_RADIUS,
    (),
  ),
  "smallWrapper": style(~width=_WRAPPER_SMALL_SIZE->dp, ~height=_WRAPPER_SMALL_SIZE->dp, ()),
  "smallTitleWrapper": style(
    ~width=_WRAPPER_SMALL_SIZE->dp,
    ~height=_WRAPPER_SMALL_SIZE->dp,
    ~borderWidth=1.0,
    ~borderRadius=_WRAPPER_SMALL_RADIUS,
    (),
  ),
  "smallTitle": style(~fontSize=_TITLE_SMALL_FONT_SIZE, ~fontWeight=_TITLE_SMALL_FONT_WEIGHT, ()),
  "smallImage": style(
    ~width=_WRAPPER_SMALL_SIZE->dp,
    ~height=_WRAPPER_SMALL_SIZE->dp,
    ~borderRadius=_WRAPPER_SMALL_RADIUS,
    (),
  ),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
