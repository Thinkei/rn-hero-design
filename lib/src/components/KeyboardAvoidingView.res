module RNKeyboardAvoidingView = ReactNative.KeyboardAvoidingView

let isIOS = Helpers.Platform.isIOS
let _APPBAR_HEIGHT = isIOS ? 44.0 : 56.0
let _STATUSBAR_HEIGHT = isIOS ? 20.0 : 0.0
let _HEADER_HEIGHT = _APPBAR_HEIGHT +. _STATUSBAR_HEIGHT

@react.component
let make = (~children, ~style=?, ~withNavigation=?) => {
  /*
   * If IPX+: topInset = 44, statusBar = 20
   * If IP8-: topInset = 20, statusBar = 20
   */
  let topInset = RNSafeAreaView.getInset(#top, Helpers.isLandscape()->Some)
  <RNKeyboardAvoidingView
    ?style
    behavior={isIOS ? #padding : #height}
    keyboardVerticalOffset={switch (withNavigation, isIOS) {
    | (Some(true), true) => _HEADER_HEIGHT +. topInset -. _STATUSBAR_HEIGHT
    | (Some(true), false) => _HEADER_HEIGHT +. topInset
    | (_, _) => 0.0
    }}>
    children
  </RNKeyboardAvoidingView>
}

let default = make
