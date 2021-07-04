open ReactNative

module Wrapper = {
  @react.component
  let make = (~onPress=?, ~style, ~children) =>
    switch onPress {
    | None => <View style> children </View>
    | Some(onPress) => <TouchableOpacity onPress style> children </TouchableOpacity>
    }
}

let \"||=" = Belt.Option.getWithDefault

let emptyStyle = Style.style()

@react.component
let make = (
  ~title,
  ~subtitle=?,
  ~onPress=?,
  ~leftElement=?,
  ~rightElement=?,
  ~wrapperStyle=?,
  ~titleStyle=?,
  ~subtitleStyle=?,
  ~theme=Hero_Theme.default,
  ~testID="",
) =>
  <Wrapper
    style={StyleSheet.flatten([theme["listItem"]["wrapper"], \"||="(wrapperStyle, emptyStyle)])}
    ?onPress>
    <View testID style={theme["listItem"]["contentWrapper"]}>
      {\"||="(leftElement, React.null)}
      <View style={theme["listItem"]["textWrapper"]}>
        <View>
          <Text
            style={StyleSheet.flatten([
              theme["listItem"]["title"],
              \"||="(titleStyle, emptyStyle),
            ])}>
            title
          </Text>
          {switch subtitle {
          | None => React.null
          | Some(subtitle) =>
            <Text
              style={StyleSheet.flatten([
                theme["listItem"]["subtitle"],
                \"||="(subtitleStyle, emptyStyle),
              ])}>
              subtitle
            </Text>
          }}
        </View>
      </View>
    </View>
    {\"||="(rightElement, React.null)}
  </Wrapper>

let default = Helpers.injectTheme(make)
