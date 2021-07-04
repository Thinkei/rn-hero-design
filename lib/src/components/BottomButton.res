open ReactNative

@get external getColorProperty: Style.t => Color.t = "color"

module Wrapper = {
  @react.component
  let make = (~enabled, ~onPress=?, ~style, ~children) =>
    switch (enabled, onPress) {
    | (true, Some(onPress)) => <TouchableOpacity onPress style> children </TouchableOpacity>
    | (_, _) => <View style> children </View>
    }
}

let emptyStyle = Style.style()

@react.component
let make = (
  ~text,
  ~onPress,
  ~disabled=false,
  ~loading=false,
  ~forceInset=?,
  ~wrapperStyle=emptyStyle,
  ~buttonStyle=emptyStyle,
  ~textStyle=emptyStyle,
  ~theme=Hero_Theme.default,
) => {
  let (showKeyboard, setShowKeyboard) = React.useState(() => false)
  let hasHomeBar = Helpers.hasHomeBar()
  let themeWrapperStyle = switch (forceInset, showKeyboard, hasHomeBar) {
  | (Some("always"), _, _) => theme["bottomButton"]["wrapperWithHomeBar"]
  | (Some("never"), _, _) => theme["bottomButton"]["wrapperWithoutHomeBar"]
  | (_, false, true) => theme["bottomButton"]["wrapperWithHomeBar"]
  | (_, _, _) => theme["bottomButton"]["wrapperWithoutHomeBar"]
  }

  React.useEffect0(() => {
    let listener = Keyboard.addListener(#keyboardWillShow, _ => setShowKeyboard(_ => true))
    Some(() => EventSubscription.remove(listener))
  })

  React.useEffect0(() => {
    let listener = Keyboard.addListener(#keyboardWillHide, _ => setShowKeyboard(_ => false))
    Some(() => EventSubscription.remove(listener))
  })

  <Wrapper
    enabled={!loading && !disabled}
    style={StyleSheet.flatten([
      theme["bottomButton"]["wrapper"],
      themeWrapperStyle,
      disabled ? theme["bottomButton"]["disabledWrapper"] : emptyStyle,
      wrapperStyle,
    ])}
    ?onPress>
    <View style={StyleSheet.flatten([theme["bottomButton"]["button"], buttonStyle])}>
      {switch (loading, disabled) {
      | (true, false) =>
        <ActivityIndicator
          size=ActivityIndicator.Size.small
          color={getColorProperty(theme["bottomButton"]["loadingIndicator"])}
        />
      | (_, _) =>
        <Text
          style={StyleSheet.flatten([
            theme["bottomButton"]["text"],
            disabled ? theme["bottomButton"]["disabledText"] : emptyStyle,
            textStyle,
          ])}>
          text
        </Text>
      }}
    </View>
  </Wrapper>
}

let default = Helpers.injectTheme(make)
