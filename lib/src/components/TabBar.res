open ReactNative

@set
external setTabSubComponent: (React.component<'props1>, React.component<'props2>) => unit = "Tab"

@get
external getTabProps: React.element => {..
  "title": option<React.element>,
  "children": option<React.element>,
} = "props"

@module("react") @scope("Children") @val
external toArray: React.element => array<React.element> = "toArray"

let emptyStyle = Style.style()

let noop = _ => ()

module Tab = {
  @react.component
  let make = () => React.null
}

@react.component
let make = (
  ~selectedIndex=0,
  ~onSelect=noop,
  ~children,
  ~wrapperStyle=emptyStyle,
  ~tabStyle=emptyStyle,
  ~contentStyle=emptyStyle,
  ~theme=Hero_Theme.default,
) => {
  let tabs = children->toArray

  let (contents, setContents) = React.useState(_ => {
    open Array
    make(length(tabs), React.null)
  })

  let titles: array<React.element> =
    tabs
    ->Belt.Array.map(tab => getTabProps(tab)["title"])
    ->Belt.Array.mapWithIndex((index, title) => {
      let title = title->Belt.Option.getWithDefault(React.null)
      <TouchableOpacity
        key={index->string_of_int}
        onPress={_ => onSelect(index)}
        style={StyleSheet.flatten([
          theme["tabBar"]["tab"],
          index === selectedIndex ? theme["tabBar"]["selectedTab"] : emptyStyle,
          tabStyle,
        ])}>
        title
      </TouchableOpacity>
    })

  React.useEffect1(() => {
    let selectedContent =
      tabs
      ->Belt.Array.map(tab => getTabProps(tab)["children"]->Belt.Option.getWithDefault(React.null))
      ->Belt.Array.get(selectedIndex)
      ->Belt.Option.getWithDefault(React.null)

    setContents(contents => {
      let contents = Array.copy(contents)
      contents[selectedIndex] = selectedContent
      contents
    })

    None
  }, [selectedIndex])

  <View style={StyleSheet.flatten([theme["tabBar"]["wrapper"], wrapperStyle])}>
    <View style={StyleSheet.flatten([theme["tabBar"]["navigator"]])}> {titles->React.array} </View>
    <View style={StyleSheet.flatten([theme["tabBar"]["content"], contentStyle])}>
      {contents
      ->Belt.Array.mapWithIndex((index, content) =>
        <View
          key={string_of_int(index)}
          style={Style.style(~display=index == selectedIndex ? #flex : #none, ~flex=1.0, ())}>
          content
        </View>
      )
      ->React.array}
    </View>
  </View>
}

setTabSubComponent(make, Tab.make)

let default = Helpers.injectTheme(make)
