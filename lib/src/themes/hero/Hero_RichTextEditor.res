open ReactNative.Style
open Hero_Variables

let _TOOLBAR_BACKGROUND_COLOR = _GREY_5
let _TOOLBAR_BORDER_COLOR = _BORDER_COLOR
let _TOOLBAR_BUTTON_SIZE = _LARGE_SIZE +. _SMALL_SIZE *. 2.0
let _SEPARATOR_HEIGHT = _MEDIUM_SIZE
let _SEPARATOR_MARGIN = _MEDIUM_SIZE
let _SEPARATOR_COLOR = _BORDER_COLOR
let _EDITOR_FONT_SIZE = _HEADER_4
let _EDITOR_PADDING = _MEDIUM_SIZE
let _EDITOR_MARGIN = _MEDIUM_SIZE
let _EDITOR_BORDER_COLOR = _BORDER_COLOR
let _ERROR_FONT_SIZE = _HEADER_5
let _ERROR_MARGIN_VERTICAL = _SMALL_SIZE
let _ERROR_COLOR = _DANGER_COLOR

let styles: Js.t<'a> = {
  "wrapper": style(~marginBottom=_EDITOR_MARGIN->dp, ()),
  "webview": style(
    ~minHeight=120.0->dp,
    ~backgroundColor="transparent",
    ~borderBottomWidth=0.8,
    ~borderBottomColor=_EDITOR_BORDER_COLOR,
    (),
  ),
  "editor": style(~padding=_EDITOR_PADDING->dp, ~fontSize=_EDITOR_FONT_SIZE, ()),
  "suggestionList": style(),
  "toolbar": style(
    ~flexDirection=#row,
    ~alignItems=#center,
    ~borderTopWidth=ReactNative.StyleSheet.hairlineWidth,
    ~borderTopColor=_TOOLBAR_BORDER_COLOR,
    ~backgroundColor=_TOOLBAR_BACKGROUND_COLOR,
    (),
  ),
  "toolbarButton": style(
    ~width=_TOOLBAR_BUTTON_SIZE->dp,
    ~height=_TOOLBAR_BUTTON_SIZE->dp,
    ~alignItems=#center,
    ~justifyContent=#center,
    (),
  ),
  "separator": style(
    ~width=0.0->dp,
    ~height=_SEPARATOR_HEIGHT->dp,
    ~marginHorizontal=_SEPARATOR_MARGIN->dp,
    ~borderRightWidth=1.0,
    ~borderRightColor=_SEPARATOR_COLOR,
    (),
  ),
  "errorMessage": style(
    ~minHeight=_ERROR_FONT_SIZE->dp,
    ~lineHeight=_ERROR_FONT_SIZE,
    ~marginTop=_ERROR_MARGIN_VERTICAL->dp,
    ~fontFamily=?_FONT_FAMILY,
    ~fontSize=_ERROR_FONT_SIZE,
    ~fontWeight=#_500,
    ~color=_ERROR_COLOR,
    (),
  ),
  "errorWebview": style(~borderBottomColor=_ERROR_COLOR, ()),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
