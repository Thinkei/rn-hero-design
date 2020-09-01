open ReactNative;

[@bs.get] external getLeftProperty: Style.t => float = "left";

let noop = _ => ();

[@react.component]
let make = (~value=false, ~onValueChange=noop, ~theme=Hero_Theme.default) => {
  let offset =
    value
      ? theme##_switch##thumbOn->getLeftProperty
      : theme##_switch##thumbOff->getLeftProperty;
  let (animatedOffset, _) =
    React.useState(() => Animated.Value.create(offset));

  React.useEffect1(
    _ => {
      open Animated.Value.Timing;
      let config =
        config(
          ~toValue=fromRawValue(offset),
          ~duration=200.0,
          ~useNativeDriver=true,
          (),
        );
      Animated.start(Animated.timing(animatedOffset, config), ());
      None;
    },
    [|value|],
  );

  <TouchableWithoutFeedback onPress={_ => onValueChange(!value)}>
    <View
      style={StyleSheet.flatten([|
        theme##_switch##track,
        value ? theme##_switch##trackOn : theme##_switch##trackOff,
      |])}>
      <View style={theme##_switch##thumbWrapper}>
        <Animated.View
          style={StyleSheet.flatten([|
            theme##_switch##thumb,
            value ? theme##_switch##thumbOn : theme##_switch##thumbOff,
            Style.style(~left=Animated.StyleProp.size(animatedOffset), ()),
          |])}
        />
      </View>
    </View>
  </TouchableWithoutFeedback>;
};

let default = Helpers.injectTheme(make);
