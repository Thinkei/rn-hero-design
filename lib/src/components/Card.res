open ReactNative

let emptyStyle = Style.style()

@react.component
let make = (~children, ~style=?, ~theme=Hero_Theme.default) =>
  <View
    style={StyleSheet.flatten([
      theme["card"]["card"],
      style->Belt.Option.getWithDefault(emptyStyle),
    ])}>
    children
  </View>

let default = Helpers.injectTheme(make)
