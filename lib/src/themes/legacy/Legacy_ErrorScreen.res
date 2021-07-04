open ReactNative.Style
open Legacy_Variables

let window = ReactNative.Dimensions.get(#window)

let _CONTAINER_PADDING = _MEDIUM_SIZE *. 2.0
let _CONTAINER_BACKGROUND_COLOR = _WHITE
let _IMAGE_SIZE = window.width *. 2.0 /. 3.0
let _IMAGE_MARGIN = _MEDIUM_SIZE
let _TITLE_WRAPPER_MARGIN = _SMALL_SIZE
let _SUBTITLE_WRAPPER_MARGIN = _SMALL_SIZE
let _ACTIONS_WRAPPER_MARGIN = _LARGE_SIZE *. 4.0

let _CLOSE_BUTTON_PADDING = _MEDIUM_SIZE

let styles: Js.t<'a> = {
  "container": style(
    ~flex=1.0,
    ~alignItems=#center,
    ~justifyContent=#center,
    ~padding=_CONTAINER_PADDING->dp,
    ~backgroundColor=_CONTAINER_BACKGROUND_COLOR,
    (),
  ),
  "image": style(
    ~width=_IMAGE_SIZE->dp,
    ~height=_IMAGE_SIZE->dp,
    ~marginBottom=_IMAGE_MARGIN->dp,
    (),
  ),
  "titleWrapper": style(~marginVertical=_TITLE_WRAPPER_MARGIN->dp, ()),
  "subtitleWrapper": style(~marginVertical=_SUBTITLE_WRAPPER_MARGIN->dp, ()),
  "actionsWrapper": style(~marginTop=_ACTIONS_WRAPPER_MARGIN->dp, ()),
  "closeButton": style(
    ~position=#absolute,
    ~top=0.0->dp,
    ~right=0.0->dp,
    ~padding=_CLOSE_BUTTON_PADDING->dp,
    (),
  ),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
