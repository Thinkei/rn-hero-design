open ReactNative.Style
open Hero_Variables

let _THUMB_SIZE = _BASE_SIZE *. 1.5
let _THUMB_COLOR = _WHITE
let _TRACK_WIDTH = _THUMB_SIZE *. 2.0
let _TRACK_HEIGHT = _THUMB_SIZE
let _TRACK_COLOR_ON = _PRIMARY_COLOR
let _TRACK_COLOR_OFF = _DISABLED_BACKGROUND_COLOR
let _WRAPPER_PADDING = 2.0
let _WRAPPER_WIDTH = _TRACK_WIDTH +. _WRAPPER_PADDING *. 2.0
let _WRAPPER_HEIGHT = _TRACK_HEIGHT +. _WRAPPER_PADDING *. 2.0

let styles: Js.t<'a> = {
  "track": style(
    ~width=_WRAPPER_WIDTH->dp,
    ~height=_WRAPPER_HEIGHT->dp,
    ~padding=_WRAPPER_PADDING->dp,
    ~borderRadius=_WRAPPER_HEIGHT /. 2.0,
    (),
  ),
  "trackOn": style(~backgroundColor=_TRACK_COLOR_ON, ()),
  "trackOff": style(~backgroundColor=_TRACK_COLOR_OFF, ()),
  "thumbWrapper": style(
    ~width=_TRACK_WIDTH->dp,
    ~height=_TRACK_HEIGHT->dp,
    ~borderRadius=_TRACK_HEIGHT /. 2.0,
    (),
  ),
  "thumb": style(
    ~position=#absolute,
    ~top=0.0->dp,
    ~width=_THUMB_SIZE->dp,
    ~height=_THUMB_SIZE->dp,
    ~backgroundColor=_THUMB_COLOR,
    ~borderRadius=_THUMB_SIZE /. 2.0,
    (),
  ),
  "thumbOff": style(~left=0.0->dp, ()),
  "thumbOn": style(~left=(_TRACK_WIDTH -. _THUMB_SIZE)->dp, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
