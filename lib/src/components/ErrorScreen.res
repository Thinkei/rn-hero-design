module RN = ReactNative

@react.component
let make = (
  ~imageSource,
  ~title=React.null,
  ~subtitle=React.null,
  ~actions=React.null,
  ~onPressClose=?,
  ~theme=Hero_Theme.default,
) => {
  let closeButton = switch onPressClose {
  | None => React.null
  | Some(onPressClose) =>
    <RN.TouchableOpacity
      onPress=onPressClose style={theme["errorScreen"]["closeButton"]} testID="closeButton">
      <Icon icon="cancel-outline" size=24.0 />
    </RN.TouchableOpacity>
  }

  <Container direction="column" style={theme["errorScreen"]["container"]}>
    closeButton
    <RN.Image source=imageSource resizeMode=#contain style={theme["errorScreen"]["image"]} />
    <RN.View style={theme["errorScreen"]["titleWrapper"]}> title </RN.View>
    <RN.View style={theme["errorScreen"]["subtitleWrapper"]}> subtitle </RN.View>
    <RN.View style={theme["errorScreen"]["actionsWrapper"]}> actions </RN.View>
  </Container>
}

let default = Helpers.injectTheme(make)
