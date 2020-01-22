open ReactNative;

[@bs.get] external getColorProperty: Style.t => Color.t = "color";

module SvgXml = {
  [@react.component] [@bs.module "react-native-svg"]
  external make: (~xml: string, ~override: Js.t('a)) => React.element =
    "SvgXml";
};

let%macro.toplevel useIcon = (iconName, iconPath) => {
  [%str
    [@bs.module "../icons/$eval{iconPath}"] external eval__iconName: string = "default";
  ];
};

[%%useIcon (email, "email")];
[%%useIcon (emailOutline, "email-outline")];
[%%useIcon (eye, "eye")];
[%%useIcon (eyeOutline, "eye-outline")];
[%%useIcon (eyeInvisible, "eye-invisible")];
[%%useIcon (eyeInvisibleOutline, "eye-invisible-outline")];
[%%useIcon (okCircle, "ok-circle")];
[%%useIcon (calendar, "calendar")];
[%%useIcon (clockCircleOutline, "clock-circle-outline")];
[%%useIcon (commentOutline, "comment-outline")];
[%%useIcon (cancelOutline, "cancel-outline")];
[%%useIcon (plusCircleOutline, "plus-circle-outline")];
[%%useIcon (plusOutline, "plus-outline")];
[%%useIcon (piggyBankOutline, "piggy-bank-outline")];
[%%useIcon (targetOutline, "target-outline")];
[%%useIcon (singleRightOutline, "single-right-outline")];
[%%useIcon (moreVertical, "more-vertical")];
[%%useIcon (calendarOutline, "calendar-outline")];
[%%useIcon (phoneOutline, "phone-outline")];
[%%useIcon (faceId, "face-id")];

let xmlFromIcon = icon =>
  switch (icon) {
  | "email" => Some(email)
  | "email-outline" => Some(emailOutline)
  | "eye" => Some(eye)
  | "eye-outline" => Some(eyeOutline)
  | "eye-invisible" => Some(eyeInvisible)
  | "eye-invisible-outline" => Some(eyeInvisibleOutline)
  | "ok-circle" => Some(okCircle)
  | "calendar" => Some(calendar)
  | "calendar-outline" => Some(calendarOutline)
  | "clock-circle-outline" => Some(clockCircleOutline)
  | "comment-outline" => Some(commentOutline)
  | "cancel-outline" => Some(cancelOutline)
  | "plus-circle-outline" => Some(plusCircleOutline)
  | "plus-outline" => Some(plusOutline)
  | "piggy-bank-outline" => Some(piggyBankOutline)
  | "target-outline" => Some(targetOutline)
  | "single-right-outline" => Some(singleRightOutline)
  | "more-vertical" => Some(moreVertical)
  | "phone-outline" => Some(phoneOutline)
  | "face-id" => Some(faceId)
  | _ => None
  };

[@react.component]
let make =
    (~icon, ~size=24.0, ~color=?, ~wrapperStyle, ~theme=Hero_Theme.default) => {
  let iconColor =
    color->Belt.Option.getWithDefault @@ getColorProperty @@  theme##icon##icon;

  switch (xmlFromIcon(icon)) {
  | None => ReasonReact.null
  | Some(xml) =>
    <View
      style={StyleSheet.flatten([|
        Style.(
          style(
            ~display=`flex,
            ~alignItems=`center,
            ~justifyContent=`center,
            ~width=size->dp,
            ~height=size->dp,
            (),
          )
        ),
        wrapperStyle,
      |])}>
      <SvgXml
        xml
        override={
          "width": size,
          "height": size,
          "stroke": iconColor,
          "fill": iconColor,
        }
      />
    </View>
  };
};

let default = Helpers.injectTheme(make);
