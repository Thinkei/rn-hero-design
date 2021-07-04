open ReactNative

let noop = _ => ()

@deriving(jsConverter)
type mode = [#date | #time]

module DateTimePickerIOS = {
  @react.component
  let make = (~show, ~mode, ~value, ~onChange, ~onDismiss, ~theme) => {
    let (pickedDate, setPickedDate) = React.useState(() => value)

    let handleSelect = React.useCallback1(_ => {
      onChange(pickedDate)
      onDismiss()
    }, [pickedDate])

    let handleCancel = React.useCallback(_ => onDismiss())

    let handleKeyboardWillShow = React.useCallback(_ => onDismiss())

    let handleChange = (. _, date) =>
      switch Js.Nullable.toOption(date) {
      | Some(date) => setPickedDate(_ => date)
      | None => ()
      }

    React.useEffect2(_ => {
      if show {
        Keyboard.dismiss()
      }
      let keyboardWillShowListener = Keyboard.addListener(#keyboardWillShow, handleKeyboardWillShow)
      setPickedDate(_ => value)
      Some(() => EventSubscription.remove(keyboardWillShowListener))
    }, (show, value))

    if !show {
      React.null
    } else {
      <RNSafeAreaView
        forceInset={"bottom": "always", "top": "never"} style={theme["dateTimePicker"]["wrapper"]}>
        <View style={theme["dateTimePicker"]["actions"]}>
          <TouchableOpacity onPress=handleCancel style={theme["dateTimePicker"]["action"]}>
            <Text style={theme["dateTimePicker"]["actionText"]}> {"Cancel"->React.string} </Text>
          </TouchableOpacity>
          <TouchableOpacity onPress=handleSelect style={theme["dateTimePicker"]["action"]}>
            <Text
              style={StyleSheet.flatten([
                theme["dateTimePicker"]["actionText"],
                Style.style(~fontWeight=#_600, ()),
              ])}>
              {"Done"->React.string}
            </Text>
          </TouchableOpacity>
        </View>
        <RNCDateTimePicker mode display=#spinner value=pickedDate onChange=handleChange />
      </RNSafeAreaView>
    }
  }
}

module DateTimePickerAndroid = {
  @react.component
  let make = (~show, ~mode, ~value, ~onChange, ~onDismiss) => {
    let handleChange = (. _, date) =>
      switch Js.Nullable.toOption(date) {
      | Some(date) =>
        onDismiss()
        onChange(date)
      | None => onDismiss()
      }

    if !show {
      React.null
    } else {
      <RNCDateTimePicker mode display=#default value onChange=handleChange />
    }
  }
}

@react.component
let make = (
  ~show=false,
  ~value: Js.Date.t=Js.Date.make(),
  ~mode=?,
  ~onChange=noop,
  ~onDismiss=noop,
  ~theme=Hero_Theme.default,
) => {
  let mode_ = mode->Belt.Option.flatMap(modeFromJs)->Belt.Option.getWithDefault(#date)

  Helpers.Platform.isAndroid
    ? <DateTimePickerAndroid show mode=mode_ value onChange onDismiss />
    : <DateTimePickerIOS show mode=mode_ value onChange onDismiss theme />
}

let default = Helpers.injectTheme(make)
