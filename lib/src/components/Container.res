open ReactNative

@deriving(jsConverter)
type containerDirection = [#column | #row | #columnReverse | #rowReverse]

let noStyle = Style.style()

let \"|?" = (x, y) =>
  switch x {
  | Some(x) => x
  | None => y
  }

@react.component
let make = (~children, ~fluid=false, ~direction, ~style=?, ~theme=Hero_Theme.default) => {
  let direction = containerDirectionFromJs(direction)->Belt.Option.getWithDefault(#column)
  <View
    style={StyleSheet.flatten([
      theme["container"]["container"],
      fluid ? theme["container"]["fluid"] : noStyle,
      Style.style(~flexDirection=direction, ()),
      \"|?"(style, noStyle),
    ])}>
    children
  </View>
}

let default = Helpers.injectTheme(make)
