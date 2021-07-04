module ChangeEvent = {
  type payload = {target: int}

  include ReactNative.Event.SyntheticEvent({
    type _payload = payload
  })
}

type changeEvent = ChangeEvent.t

@react.component @module("@react-native-community/datetimepicker")
external make: (
  ~testID: string=?,
  ~mode: @string [#date | #time]=?,
  ~display: @string
  [
    | #default
    | #spinner
    | #compact
    | #inline
    | #calendar
    | #clock
  ]=?,
  ~value: Js.Date.t,
  ~onChange: (. changeEvent, Js.Nullable.t<Js.Date.t>) => unit,
) => React.element = "default"
