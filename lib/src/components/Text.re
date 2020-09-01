open ReactNative;

let emptyStyle = Style.style();

[@bs.deriving jsConverter]
type weight = [
  | [@bs.as "100"] `_100
  | [@bs.as "200"] `_200
  | [@bs.as "300"] `_300
  | [@bs.as "400"] `_400
  | [@bs.as "500"] `_500
  | [@bs.as "600"] `_600
  | [@bs.as "700"] `_700
  | [@bs.as "800"] `_800
  | [@bs.as "900"] `_900
  | `bold
  | `normal
];

[@bs.deriving jsConverter]
type ellipsizeMode = [ | `clip | `head | `middle | `tail];

let (|?) = (x, y) =>
  switch (x) {
  | Some(x) => x
  | None => y
  };

[@react.component]
let make =
    (
      ~testID=?,
      ~children,
      ~size=?,
      ~weight=?,
      ~color=?,
      ~ellipsizeMode=?,
      ~numberOfLines=?,
      ~onPress=?,
      ~style=?,
      ~theme=Hero_Theme.default,
    ) =>
  <ReactNative.Text
    ?testID
    ellipsizeMode=?{ellipsizeMode->Belt.Option.flatMap(ellipsizeModeFromJs)}
    ?numberOfLines
    ?onPress
    style={StyleSheet.flatten([|
      theme##text##text,
      Belt.Option.mapWithDefault(size, emptyStyle, size =>
        switch (size) {
        | "h1" => theme##text##h1
        | "h2" => theme##text##h2
        | "h3" => theme##text##h3
        | "h4" => theme##text##h4
        | "h5" => theme##text##h5
        | _ => emptyStyle
        }
      ),
      Style.style(
        ~fontWeight=
          weight
          ->Belt.Option.flatMap(weightFromJs)
          ->Belt.Option.getWithDefault(`_400),
        ~color?,
        (),
      ),
      style |? emptyStyle,
    |])}>
    {children |> React.string}
  </ReactNative.Text>;

let default = Helpers.injectTheme(make);
