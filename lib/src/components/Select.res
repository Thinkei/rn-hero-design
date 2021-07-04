open ReactNative

let isEmptyString = string_ => String.length(string_) == 0

let getFirstOptionValue = options =>
  switch options->Belt.Array.get(0) {
  | None => ""
  | Some(option_) => option_["value"]
  }

type option_ = {"label": string, "value": string}

let noop = _ => ()

module SelectIOS = {
  @react.component
  let make = (~options, ~show, ~value: string, ~onChange, ~onDismiss, ~theme) => {
    let (pickedValue, setPickedValue) = React.useState(() => value)
    let handleChange = React.useCallback2(_ => {
      onChange(isEmptyString(pickedValue) ? getFirstOptionValue(options) : pickedValue)
      onDismiss()
      ()
    }, (pickedValue, options))
    let handleDismiss = React.useCallback(_ => {
      onDismiss()
      ()
    })
    let handleKeyboardWillShow = React.useCallback(_ => {
      onDismiss()
      ()
    })

    React.useEffect2(_ => {
      if show {
        Keyboard.dismiss()
      }
      let keyboardWillShowListener = Keyboard.addListener(#keyboardWillShow, handleKeyboardWillShow)
      setPickedValue(_ => value)
      Some(() => EventSubscription.remove(keyboardWillShowListener))
    }, (show, value))

    if !show {
      React.null
    } else {
      <RNSafeAreaView forceInset={"bottom": "always"} style={theme["select"]["wrapper"]}>
        <View style={theme["select"]["actions"]}>
          <TouchableOpacity onPress=handleDismiss style={theme["select"]["action"]}>
            <Text style={theme["select"]["actionText"]}> {"Cancel"->React.string} </Text>
          </TouchableOpacity>
          <TouchableOpacity onPress=handleChange style={theme["select"]["action"]}>
            <Text
              style={StyleSheet.flatten([
                theme["select"]["actionText"],
                Style.style(~fontWeight=#_600, ()),
              ])}>
              {"Done"->React.string}
            </Text>
          </TouchableOpacity>
        </View>
        <Picker
          selectedValue=pickedValue
          onValueChange={(value, _) => {
            setPickedValue(_ => value)
            ()
          }}>
          {options
          ->Belt.Array.map(option =>
            <Picker.Item key={option["value"]} label={option["label"]} value={option["value"]} />
          )
          ->React.array}
        </Picker>
      </RNSafeAreaView>
    }
  }
}

let emptyStyle = Style.style()

module SelectAndroid = {
  @react.component
  let make = (~options, ~show, ~value, ~onChange, ~onDismiss, ~theme) => {
    let handleChange = React.useCallback(value => {
      onChange(value)
      onDismiss()
      ()
    })
    let handleDismiss = React.useCallback(_ => {
      onDismiss()
      ()
    })

    <Modal visible=show transparent=true animationType=#fade>
      <TouchableWithoutFeedback onPress=handleDismiss>
        <View style={theme["select"]["overlay"]}>
          <View style={theme["select"]["dialog"]}>
            <ScrollView style={Style.style(~flexGrow=0.0, ())}>
              {options
              ->Belt.Array.map(option =>
                <TouchableOpacity
                  key={option["value"]}
                  onPress={_ => handleChange(option["value"])}
                  style={theme["select"]["optionWrapper"]}>
                  <Text
                    style={StyleSheet.flatten([
                      theme["select"]["optionText"],
                      option["value"] === value
                        ? theme["select"]["selectedOptionText"]
                        : emptyStyle,
                    ])}>
                    {option["label"]->React.string}
                  </Text>
                </TouchableOpacity>
              )
              ->React.array}
            </ScrollView>
            <View />
          </View>
        </View>
      </TouchableWithoutFeedback>
    </Modal>
  }
}

@react.component
let make = (
  ~options: array<option_>=[],
  ~show=false,
  ~value="",
  ~onChange=noop,
  ~onDismiss=noop,
  ~theme=Hero_Theme.default,
) =>
  Helpers.Platform.isAndroid
    ? <SelectAndroid options show value onChange onDismiss theme />
    : <SelectIOS options show value onChange onDismiss theme />

let default = Helpers.injectTheme(make)
