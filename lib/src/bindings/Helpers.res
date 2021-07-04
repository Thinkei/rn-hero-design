@module("../helpers/injectTheme.js")
external injectTheme: React.component<'props> => React.component<'props> = "default"

let isLandscape = () => {
  let window = ReactNative.Dimensions.get(#window)
  window.width > window.height
}

let hasHomeBar = () => {
  let bottomPadding = RNSafeAreaView.getInset(#bottom, isLandscape()->Some)
  bottomPadding > 0.0
}

module Platform = {
  let isAndroid = {
    open ReactNative
    Platform.os == Platform.android
  }
  let isIOS = {
    open ReactNative
    Platform.os == Platform.ios
  }
}

@module("react-redux")
external useSelector: ('a => 'b) => 'b = "useSelector"

@scope("default") @module("../helpers/themeManager.js")
external getTheme: (~name: string) => 'a = "getTheme"

let useTheme = () => {
  let themeName = useSelector(state => state["__theme"])
  getTheme(~name=themeName)
}
