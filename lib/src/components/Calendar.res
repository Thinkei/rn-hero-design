open ReactNative

let emptyStyle = Style.style()

let noop = _ => ()

@get external getColorProperty: Style.t => Color.t = "color"

let _DAYS_OF_WEEK = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

let monthOfInt = x =>
  switch x {
  | 0 => "January"
  | 1 => "February"
  | 2 => "March"
  | 3 => "April"
  | 4 => "May"
  | 5 => "June"
  | 6 => "July"
  | 7 => "August"
  | 8 => "September"
  | 9 => "October"
  | 10 => "November"
  | 11 => "December"
  | _ => ""
  }

let formatString = float_ => float_->int_of_float->string_of_int

let formatTitleString = date => {
  open Js.Date
  date->getMonth->int_of_float->monthOfInt ++ (" " ++ date->getFullYear->formatString)
}

let eqDate = (date1, date2) => {
  open Js.Date
  toDateString(date1) === toDateString(date2)
}

let hasVisibleDate = dates => dates |> Js.Array.some(Belt.Option.isSome)

type color = string

@deriving(abstract)
type markedDate = {
  date: Js.Date.t,
  colors: array<color>,
}

type markedDates = array<markedDate>

type parsedMarkedDates = Js.Dict.t<array<color>>

@react.component
let make = (
  ~testID="",
  ~value=Js.Date.make(),
  ~onChange=noop,
  ~currentView=Js.Date.make(),
  ~onPressPrev=noop,
  ~onPressNext=noop,
  ~onPressTitle=noop,
  ~theme=Hero_Theme.default,
  ~markedDates: markedDates=[],
  ~minDate: option<Js.Date.t>=?,
  ~maxDate: option<Js.Date.t>=?,
) => {
  open Js.Date

  let currentYear = getFullYear(currentView)
  let currentMonth = getMonth(currentView)
  let now = Js.Date.make()

  let firstDateOfMonth = makeWithYMD(~year=currentYear, ~month=currentMonth, ~date=1.0, ())

  let lastDateOfMonth = makeWithYMD(~year=currentYear, ~month=currentMonth +. 1.0, ~date=0.0, ())

  let lastDateOfPreviousMonth = makeWithYMD(~year=currentYear, ~month=currentMonth, ~date=0.0, ())

  /* 0 -> 6 */
  let firstDayOfMonth = firstDateOfMonth->getDay->int_of_float

  /* 0 -> 6 */
  let lastDayOfMonth = lastDateOfMonth->getDay->int_of_float

  /* 29, 30, 31 */
  let lastDateNumberOfMonth = lastDateOfMonth->getDate->int_of_float

  /* 29, 30, 31 */
  let lastDateNumberOfPreviousMonth = lastDateOfPreviousMonth->getDate->int_of_float

  let getValidDay = date =>
    switch (minDate, maxDate) {
    | (None, None) => Some(date)
    | (Some(minDate), None) => date >= minDate ? Some(date) : None
    | (None, Some(maxDate)) => date <= maxDate ? Some(date) : None
    | (Some(minDate), Some(maxDate)) => date >= minDate && date <= maxDate ? Some(date) : None
    }

  let daysOfPreviousMonth = Array.init(firstDayOfMonth, index => {
    let reversedIndex = firstDayOfMonth - index - 1
    lastDateNumberOfPreviousMonth
    ->\"-"(reversedIndex)
    ->float_of_int
    ->makeWithYMD(~year=currentYear, ~month=currentMonth -. 1.0, ~date=_, ())
    ->getValidDay
  })

  let daysOfCurrentMonth = Array.init(lastDateNumberOfMonth, index =>
    index
    ->\"+"(1)
    ->float_of_int
    ->makeWithYMD(~year=currentYear, ~month=currentMonth, ~date=_, ())
    ->getValidDay
  )

  let daysOfNextMonth = Array.init(6 - lastDayOfMonth, index =>
    index
    ->\"+"(1)
    ->float_of_int
    ->makeWithYMD(~year=currentYear, ~month=currentMonth +. 1.0, ~date=_, ())
    ->getValidDay
  )

  let parsedMarkedDates = markedDates->Belt.Array.reduce(Js.Dict.empty(), (
    parsedMarkedDates,
    mark,
  ) => {
    let markedDateString = Js.Date.toDateString(dateGet(mark))

    switch parsedMarkedDates->Js.Dict.get(markedDateString) {
    | None =>
      parsedMarkedDates->Js.Dict.set(markedDateString, colorsGet(mark))
      parsedMarkedDates
    | Some(colors) =>
      parsedMarkedDates->Js.Dict.set(markedDateString, Array.concat(list{colors, colorsGet(mark)}))
      parsedMarkedDates
    }
  })

  let renderMarks = date => {
    let isSelected = eqDate(value, date)

    switch parsedMarkedDates->Js.Dict.get(toDateString(date)) {
    | Some(colors) =>
      <View style={theme["calendar"]["markedDay"]}>
        {colors
        ->Belt.Array.map(color =>
          <View
            key=color
            style={StyleSheet.flatten([
              theme["calendar"]["mark"],
              Style.style(~backgroundColor=color, ()),
              isSelected
                ? Style.style(
                    ~backgroundColor=getColorProperty(theme["calendar"]["selectedDayText"]),
                    (),
                  )
                : emptyStyle,
            ])}
          />
        )
        ->React.array}
      </View>
    | None => React.null
    }
  }

  let showPrevButton = switch minDate {
  | None => true
  | Some(minDate) => daysOfPreviousMonth->hasVisibleDate || minDate < firstDateOfMonth
  }

  let showNextButton = switch maxDate {
  | None => true
  | Some(maxDate) => daysOfNextMonth->hasVisibleDate || maxDate > lastDateOfMonth
  }

  <View style={theme["calendar"]["wrapper"]}>
    <View style={theme["calendar"]["header"]}>
      {showPrevButton
        ? <TouchableOpacity
            testID={testID ++ "_prev-button"}
            activeOpacity=0.2
            onPress=onPressPrev
            style={theme["calendar"]["headerButton"]}>
            <Icon icon="single-left-outline" size=20.0 />
          </TouchableOpacity>
        : <View style={theme["calendar"]["headerButton"]} />}
      <TouchableOpacity
        activeOpacity=0.2 onPress=onPressTitle style={theme["calendar"]["headerButton"]}>
        <Text style={theme["calendar"]["headerTitle"]}>
          {currentView->formatTitleString->React.string}
        </Text>
      </TouchableOpacity>
      {showNextButton
        ? <TouchableOpacity
            testID={testID ++ "_next-button"}
            activeOpacity=0.2
            onPress=onPressNext
            style={theme["calendar"]["headerButton"]}>
            <Icon icon="single-right-outline" size=20.0 />
          </TouchableOpacity>
        : <View style={theme["calendar"]["headerButton"]} />}
    </View>
    <View style={theme["calendar"]["monthView"]}>
      {_DAYS_OF_WEEK
      |> Array.map(dayName =>
        <View key=dayName style={theme["calendar"]["day"]}>
          <Text
            style={StyleSheet.flatten([
              theme["calendar"]["dayText"],
              theme["calendar"]["dayName"],
              dayName === "Sun" ? theme["calendar"]["dayNameSunday"] : emptyStyle,
            ])}>
            {dayName->React.string}
          </Text>
        </View>
      )
      |> React.array}
      {daysOfPreviousMonth
      |> Array.mapi((index, optionDate) =>
        optionDate
        ->Belt.Option.map(date =>
          <TouchableOpacity
            key={toDateString(date)}
            activeOpacity=0.2
            onPress={_ => onChange(date)}
            style={theme["calendar"]["day"]}>
            {renderMarks(date)}
            <Text
              style={StyleSheet.flatten([
                theme["calendar"]["dayText"],
                theme["calendar"]["blurredDayText"],
              ])}>
              {date->getDate->formatString->React.string}
            </Text>
          </TouchableOpacity>
        )
        ->Belt.Option.getWithDefault(
          <View
            key={index->string_of_int}
            style={StyleSheet.flatten([theme["calendar"]["day"], theme["calendar"]["hiddenDay"]])}
          />,
        )
      )
      |> React.array}
      {daysOfCurrentMonth
      |> Array.mapi((index, optionDate) =>
        optionDate
        ->Belt.Option.map(date =>
          <TouchableOpacity
            key={toDateString(date)}
            activeOpacity=0.2
            onPress={_ => onChange(date)}
            style={theme["calendar"]["day"]}>
            <View style={eqDate(value, date) ? theme["calendar"]["selectedDay"] : emptyStyle} />
            {renderMarks(date)}
            <Text
              style={StyleSheet.flatten([
                theme["calendar"]["dayText"],
                eqDate(now, date) ? theme["calendar"]["currentDayText"] : emptyStyle,
                eqDate(value, date) ? theme["calendar"]["selectedDayText"] : emptyStyle,
              ])}>
              {date->getDate->formatString->React.string}
            </Text>
          </TouchableOpacity>
        )
        ->Belt.Option.getWithDefault(
          <View
            key={index->string_of_int}
            style={StyleSheet.flatten([theme["calendar"]["day"], theme["calendar"]["hiddenDay"]])}
          />,
        )
      )
      |> React.array}
      {daysOfNextMonth
      |> Array.mapi((index, optionDate) =>
        optionDate
        ->Belt.Option.map(date =>
          <TouchableOpacity
            key={toDateString(date)}
            activeOpacity=0.2
            onPress={_ => onChange(date)}
            style={theme["calendar"]["day"]}>
            {renderMarks(date)}
            <Text
              style={StyleSheet.flatten([
                theme["calendar"]["dayText"],
                theme["calendar"]["blurredDayText"],
              ])}>
              {date->getDate->formatString->React.string}
            </Text>
          </TouchableOpacity>
        )
        ->Belt.Option.getWithDefault(
          <View
            key={index->string_of_int}
            style={StyleSheet.flatten([theme["calendar"]["day"], theme["calendar"]["hiddenDay"]])}
          />,
        )
      )
      |> React.array}
    </View>
  </View>
}

let default = Helpers.injectTheme(make)
