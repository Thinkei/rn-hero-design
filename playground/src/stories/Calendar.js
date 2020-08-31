import React from 'react';
import {
  Calendar,
  DateTimePicker,
  Container,
  injectTheme,
} from 'rn-hero-design';

const CalendarScreen = ({ theme }) => {
  const minDate = new Date(2020, 0, 31);
  const maxDate = new Date(2020, 2, 20);
  const [value, setValue] = React.useState(new Date(2020, 1, 1));
  const [currentView, setCurrentView] = React.useState(new Date(2020, 1, 1));
  const [showDatePicker, setShowDatePicker] = React.useState(false);

  return (
    <>
      <Container fluid>
        <Calendar
          minDate={minDate}
          maxDate={maxDate}
          value={value}
          currentView={currentView}
          onChange={date => {
            setValue(date);
            setCurrentView(date);
          }}
          onPressPrev={() => {
            const newDate = new Date(currentView.getTime());
            newDate.setMonth(currentView.getMonth() - 1);
            setCurrentView(newDate);
          }}
          onPressNext={() => {
            const newDate = new Date(currentView.getTime());
            newDate.setMonth(currentView.getMonth() + 1);
            setCurrentView(newDate);
          }}
          onPressTitle={() => setShowDatePicker(true)}
          markedDates={[
            {
              date: new Date(2020, 0, 30),
              colors: [theme.variables.FOCUS_BLUE_1],
            },
            {
              date: new Date(2020, 1, 2),
              colors: [
                theme.variables.FOCUS_BLUE_1,
                theme.variables.RED,
                theme.variables.ORANGE,
                theme.variables.GREEN,
              ],
            },
            {
              date: new Date(2020, 1, 3),
              colors: [],
            },
            {
              date: new Date(2020, 1, 4),
              colors: [theme.variables.FOCUS_BLUE_1],
            },
            {
              date: new Date(2020, 1, 5),
              colors: [theme.variables.FOCUS_BLUE_1],
            },
            {
              date: new Date(2020, 1, 6),
              colors: [theme.variables.FOCUS_BLUE_1],
            },
            {
              date: new Date(2020, 1, 11),
              colors: [theme.variables.FOCUS_BLUE_1],
            },
            {
              date: new Date(2020, 1, 10),
              colors: [theme.variables.FOCUS_BLUE_1],
            },
          ]}
        />
      </Container>

      <DateTimePicker
        show={showDatePicker}
        value={currentView}
        onChange={date => setCurrentView(date)}
        onDismiss={() => setShowDatePicker(false)}
      />
    </>
  );
};

export default injectTheme(CalendarScreen);
