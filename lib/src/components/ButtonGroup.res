open ReactNative

@set
external setButtonSubComponent: (React.component<'props1>, React.component<'props2>) => unit =
  "Button"

let emptyStyle = Style.style()

module Button = {
  @react.component
  let make = (
    ~text,
    ~onPress,
    ~active=false,
    ~width: option<Style.size>=?,
    ~wrapperStyle=emptyStyle,
    ~theme=Hero_Theme.default,
  ) => {
    let wrapperWidth = switch width {
    | Some(width) => Style.style(~flexBasis=width, ())
    | None => emptyStyle
    }

    <View style={StyleSheet.flatten([theme["buttonGroup"]["wrapper"], wrapperStyle, wrapperWidth])}>
      <TouchableOpacity
        onPress
        style={StyleSheet.flatten([
          theme["buttonGroup"]["button"],
          active ? theme["buttonGroup"]["activeButton"] : theme["buttonGroup"]["inactiveButton"],
        ])}>
        <Text
          style={StyleSheet.flatten([
            theme["buttonGroup"]["text"],
            active ? theme["buttonGroup"]["activeText"] : theme["buttonGroup"]["inactiveText"],
          ])}>
          {text->React.string}
        </Text>
      </TouchableOpacity>
    </View>
  }

  let make = Helpers.injectTheme(make)
}

@react.component
let make = (~children, ~theme=Hero_Theme.default) =>
  <View style={theme["buttonGroup"]["group"]}> children </View>

setButtonSubComponent(make, Button.make)

let default = Helpers.injectTheme(make)
