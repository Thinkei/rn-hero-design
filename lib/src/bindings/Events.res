type t

type eventName = string

type arguments = option<Js.Json.t>

type listener = arguments => unit

@module("events") @new external eventEmitter: unit => t = "default"

@send external on: (t, eventName, listener) => unit = "on"

@send external off: (t, eventName, listener) => unit = "off"

@send external emit: (t, eventName, arguments) => unit = "emit"

@send external setMaxListeners: (t, int) => t = "setMaxListeners"

let on' = (emitter, eventName, listener) => {
  on(emitter, eventName, listener)
  () => off(emitter, eventName, listener)
}
