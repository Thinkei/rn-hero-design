open ReactNative.Style
open Hero_Variables

let _HEADER_PADDING = _SMALL_SIZE
let _HEADER_BUTTON_PADDING = _SMALL_SIZE
let _HEADER_BUTTON_HEIGHT = 20.0 +. _HEADER_BUTTON_PADDING *. 2.0
let _HEADER_TITLE_FONT_SIZE = _HEADER_4
let _DAY_TEXT_FONT_SIZE = _HEADER_4
let _DAY_TEXT_LINE_HEIGHT = _HEADER_4
let _DAY_TEXT_COLOR = _TEXT_COLOR
let _DAY_PADDING = _SMALL_SIZE
let _DAY_HEIGHT = _DAY_TEXT_LINE_HEIGHT +. _DAY_PADDING *. 2.0
let _DAY_NAME_FONT_SIZE = _HEADER_5
let _DAY_NAME_COLOR = _MUTED_TEXT_COLOR
let _DAY_NAME_SUNDAY_COLOR = _RED
let _SELECTED_DAY_BACKGROUND_COLOR = _PRIMARY_COLOR
let _SELECTED_DAY_TEXT_COLOR = _WHITE
let _BLURRED_DAY_TEXT_COLOR = _MUTED_TEXT_COLOR
let _CURRENT_DAY_TEXT_COLOR = _PRIMARY_COLOR
let _HIDDEN_DAY_BACKGROUND_COLOR = _GREY_5

let styles: Js.t<'a> = {
  "wrapper": style(),
  "header": style(
    ~flexDirection=#row,
    ~alignItems=#center,
    ~justifyContent=#spaceBetween,
    ~paddingVertical=_HEADER_PADDING->dp,
    (),
  ),
  "headerButton": style(
    ~justifyContent=#center,
    ~height=_HEADER_BUTTON_HEIGHT->dp,
    ~minWidth=_HEADER_BUTTON_HEIGHT->dp,
    ~paddingHorizontal=_HEADER_BUTTON_PADDING->dp,
    (),
  ),
  "headerTitle": style(
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_HEADER_TITLE_FONT_SIZE,
    ~fontWeight=#_500,
    (),
  ),
  "monthView": style(~flexDirection=#row, ~flexWrap=#wrap, ~justifyContent=#center, ()),
  "day": style(
    ~flexDirection=#row,
    ~flexBasis=(100.0 /. 7.0)->Js.Math.floor_float->pct,
    ~justifyContent=#center,
    ~alignItems=#center,
    ~height=_DAY_HEIGHT->dp,
    (),
  ),
  "dayText": style(
    ~lineHeight=_DAY_TEXT_LINE_HEIGHT,
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_DAY_TEXT_FONT_SIZE,
    ~fontWeight=#_400,
    ~color=_DAY_TEXT_COLOR,
    (),
  ),
  "dayName": style(~fontSize=_DAY_NAME_FONT_SIZE, ~fontWeight=#_500, ~color=_DAY_NAME_COLOR, ()),
  "dayNameSunday": style(~color=_DAY_NAME_SUNDAY_COLOR, ()),
  "selectedDay": style(
    ~position=#absolute,
    ~width=_DAY_HEIGHT->dp,
    ~height=_DAY_HEIGHT->dp,
    ~backgroundColor=_SELECTED_DAY_BACKGROUND_COLOR,
    ~borderRadius=_DAY_HEIGHT /. 2.0,
    (),
  ),
  "selectedDayText": style(~fontWeight=#_500, ~color=_SELECTED_DAY_TEXT_COLOR, ()),
  "blurredDayText": style(~color=_BLURRED_DAY_TEXT_COLOR, ()),
  "currentDayText": style(~color=_CURRENT_DAY_TEXT_COLOR, ()),
  "markedDay": style(
    ~position=#absolute,
    ~bottom=(_DAY_PADDING /. 2.0)->dp,
    ~flexDirection=#row,
    (),
  ),
  "mark": style(~width=4.0->dp, ~height=4.0->dp, ~marginHorizontal=1.0->dp, ~borderRadius=2.0, ()),
  "hiddenDay": style(~backgroundColor=_HIDDEN_DAY_BACKGROUND_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
