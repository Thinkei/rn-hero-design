@module("react-native-safe-area-view")
external getInset: (@string [#bottom | #top], option<bool>) => float = "getInset"

@react.component @module("react-native-safe-area-view")
external make: (
  ~forceInset: 'a=?,
  ~style: ReactNative.Style.t=?,
  ~children: React.element=?,
) => React.element = "default"
