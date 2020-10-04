open ReactNative;

module BadgeVariant: {
  type t;
  [@bs.inline "error"]
  let error: t;
  [@bs.inline "warning"]
  let warning: t;
  [@bs.inline "success"]
  let success: t;
  [@bs.inline "info"]
  let info: t;
} = {
  type t = string;
  [@bs.inline]
  let error = "error";
  [@bs.inline]
  let warning = "warning";
  [@bs.inline]
  let success = "success";
  [@bs.inline]
  let info = "info";
};

let getStylesByVariant = (variant: BadgeVariant.t, styles: Js.t('a)) => {
  BadgeVariant.(
    switch (variant) {
    | v when v === error => {
        "wrapper": styles##errorWrapper,
        "content": styles##errorContent,
      }
    | v when v === warning => {
        "wrapper": styles##warningWrapper,
        "content": styles##warningContent,
      }
    | v when v === success => {
        "wrapper": styles##successWrapper,
        "content": styles##successContent,
      }
    | _ => {"wrapper": styles##infoWrapper, "content": styles##infoContent}
    }
  );
};

let emptyStyle = Style.style();

[@react.component]
let make =
    (
      ~variant,
      ~content,
      ~wrapperStyle=emptyStyle,
      ~contentStyle=emptyStyle,
      ~theme=Hero_Theme.default,
    ) => {
  let styles = variant->getStylesByVariant(theme##badge);

  <View
    style={StyleSheet.flatten([|
      theme##badge##wrapper,
      styles##wrapper,
      wrapperStyle,
    |])}>
    <Text
      style={StyleSheet.flatten([|
        theme##badge##content,
        styles##content,
        contentStyle,
      |])}>
      content->React.string
    </Text>
  </View>;
};

let default = Helpers.injectTheme(make);
