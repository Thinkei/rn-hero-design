open ReactNative

module BadgeVariant: {
  type t
  @inline("error")
  let error: t
  @inline("warning")
  let warning: t
  @inline("success")
  let success: t
  @inline("info")
  let info: t
} = {
  type t = string
  @inline
  let error = "error"
  @inline
  let warning = "warning"
  @inline
  let success = "success"
  @inline
  let info = "info"
}

let getStylesByVariant = (variant: BadgeVariant.t, styles: 'a) => {
  open BadgeVariant
  switch variant {
  | v if v === error => {
      "wrapper": styles["errorWrapper"],
      "content": styles["errorContent"],
    }
  | v if v === warning => {
      "wrapper": styles["warningWrapper"],
      "content": styles["warningContent"],
    }
  | v if v === success => {
      "wrapper": styles["successWrapper"],
      "content": styles["successContent"],
    }
  | _ => {"wrapper": styles["infoWrapper"], "content": styles["infoContent"]}
  }
}

let emptyStyle = Style.style()

@react.component
let make = (
  ~variant,
  ~content,
  ~wrapperStyle=emptyStyle,
  ~contentStyle=emptyStyle,
  ~theme=Hero_Theme.default,
) => {
  let styles = variant->getStylesByVariant(theme["badge"])

  <View style={StyleSheet.flatten([theme["badge"]["wrapper"], styles["wrapper"], wrapperStyle])}>
    <Text style={StyleSheet.flatten([theme["badge"]["content"], styles["content"], contentStyle])}>
      {content->React.string}
    </Text>
  </View>
}

let default = Helpers.injectTheme(make)
