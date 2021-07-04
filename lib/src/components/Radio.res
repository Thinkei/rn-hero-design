open ReactNative

@get external getColorProperty: Style.t => Color.t = "color"

let noop = _ => ()

@react.component
let make = (~label="", ~checked=false, ~onPress=noop, ~theme=Hero_Theme.default) =>
  <TouchableOpacity onPress style={theme["radio"]["wrapper"]}>
    {checked
      ? <Icon icon="radio-active" color={theme["radio"]["activeIcon"]->getColorProperty} />
      : <Icon icon="radio-inactive" color={theme["radio"]["inactiveIcon"]->getColorProperty} />}
    <Text style={theme["radio"]["label"]}> {label->React.string} </Text>
  </TouchableOpacity>

let default = Helpers.injectTheme(make)
