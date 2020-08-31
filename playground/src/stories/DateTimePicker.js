import React, { useState } from 'react';
import { View, TouchableOpacity } from 'react-native';
import {
  DateTimePicker,
  TextInput,
  Container,
  ReDateTimePicker,
} from 'rn-hero-design';

const noop = () => {};

const DateTimePickerScreen = () => {
  const today = new Date();
  const [startDate, setStartDate] = useState(today);
  const [endDate, setEndDate] = useState(today);
  const [changingField, setChangingField] = useState(null);

  const fieldMap = {
    startDate: {
      value: startDate,
      onChange: setStartDate,
    },
    endDate: {
      value: endDate,
      onChange: setEndDate,
    },
    null: {
      value: today,
      onChange: noop,
    },
  };

  return (
    <>
      <Container fluid>
        <TouchableOpacity onPress={() => setChangingField('startDate')}>
          <View pointerEvents="none">
            <TextInput
              label="Start date"
              value={startDate.toISOString()}
              onChangeText={noop}
            />
          </View>
        </TouchableOpacity>

        <TouchableOpacity onPress={() => setChangingField('endDate')}>
          <View pointerEvents="none">
            <TextInput
              label="End date"
              value={endDate.toISOString()}
              onChangeText={noop}
            />
          </View>
        </TouchableOpacity>
      </Container>

      <ReDateTimePicker
        show={!!changingField}
        value={fieldMap[changingField].value}
        onChange={date => fieldMap[changingField].onChange(date)}
        onDismiss={() => setChangingField(null)}
      />
    </>
  );
};

export default DateTimePickerScreen;
