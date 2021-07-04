open ReactNative.Style
open Legacy_Variables

let _GLOBAL_BACKGROUND_COLOR = _BACKGROUND_COLOR
let _BORDER_RADIUS = _SMALL_SIZE

let styles: Js.t<'a> = {
  "card": style(
    ~overflow=#hidden,
    ~backgroundColor=_GLOBAL_BACKGROUND_COLOR,
    ~borderRadius=_BORDER_RADIUS,
    (),
  ),
}

let default: Js.t<'a> = ReactNative.StyleSheet.create(styles)
