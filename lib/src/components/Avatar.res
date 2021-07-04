open ReactNative

let \"||=" = Belt.Option.getWithDefault

let emptyStyle = Style.style()

type stylesBySize = {
  "wrapper": Style.t,
  "title": Style.t,
  "titleWrapper": Style.t,
  "image": Style.t,
}

let getStylesBySize: (option<string>, 'a) => stylesBySize = (size, styles) => {
  let mediumSizeStyles = {
    "wrapper": styles["mediumWrapper"],
    "titleWrapper": styles["mediumTitleWrapper"],
    "title": styles["mediumTitle"],
    "image": styles["mediumImage"],
  }
  let largeSizeStyles = {
    "wrapper": styles["largeWrapper"],
    "titleWrapper": styles["largeTitleWrapper"],
    "title": styles["largeTitle"],
    "image": styles["largeImage"],
  }
  let smallSizeStyles = {
    "wrapper": styles["smallWrapper"],
    "titleWrapper": styles["smallTitleWrapper"],
    "title": styles["smallTitle"],
    "image": styles["smallImage"],
  }
  size->Belt.Option.mapWithDefault(mediumSizeStyles, x =>
    switch x {
    | "large" => largeSizeStyles
    | "small" => smallSizeStyles
    | _ => mediumSizeStyles
    }
  )
}

@react.component
let make = (
  ~source=?,
  ~size=?,
  ~title="",
  ~wrapperStyle=?,
  ~titleStyle=?,
  ~theme=Hero_Theme.default,
) => {
  let styles: stylesBySize = size->getStylesBySize(theme["avatar"])

  <View
    style={StyleSheet.flatten([
      theme["avatar"]["wrapper"],
      styles["wrapper"],
      \"||="(wrapperStyle, emptyStyle),
    ])}>
    <View style={StyleSheet.flatten([theme["avatar"]["titleWrapper"], styles["titleWrapper"]])}>
      <Text
        style={StyleSheet.flatten([
          theme["avatar"]["title"],
          styles["title"],
          \"||="(titleStyle, emptyStyle),
        ])}>
        {title->React.string}
      </Text>
    </View>
    {switch source {
    | Some(source') =>
      <Image
        resizeMode=#cover
        source={Image.uriSource(~uri=source', ())->Image.Source.fromUriSource}
        style={StyleSheet.flatten([theme["avatar"]["image"], styles["image"]])}
      />
    | None => React.null
    }}
  </View>
}

let default = Helpers.injectTheme(make)
