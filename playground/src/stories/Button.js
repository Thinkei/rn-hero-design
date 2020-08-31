import React from 'react';
import { Alert, ScrollView } from 'react-native';
import { Button, ReButton, injectTheme } from 'rn-hero-design';

const callback = () => Alert.alert('Button clicked!');

const ButtonScreen = ({ theme }) => (
  <ScrollView contentContainerStyle={{ padding: theme.variables.MEDIUM_SIZE }}>
    <Button
      text="Filled Button"
      onPress={callback}
      wrapperStyle={{ marginBottom: theme.variables.MEDIUM_SIZE }}
    />
    <Button
      text="Loading Filled Button"
      onPress={callback}
      loading
      wrapperStyle={{ marginBottom: theme.variables.MEDIUM_SIZE }}
    />
    <Button
      text="Disabled Filled Button"
      onPress={callback}
      disabled
      wrapperStyle={{ marginBottom: theme.variables.MEDIUM_SIZE }}
    />

    <Button
      variant="outlined"
      text="Outlined Button"
      onPress={callback}
      wrapperStyle={{ marginBottom: theme.variables.MEDIUM_SIZE }}
    />
    <Button
      variant="outlined"
      text="Loading Outlined Button"
      onPress={callback}
      loading
      wrapperStyle={{ marginBottom: theme.variables.MEDIUM_SIZE }}
    />
    <Button
      variant="outlined"
      text="Disabled Outlined Button"
      onPress={callback}
      disabled
      wrapperStyle={{ marginBottom: theme.variables.MEDIUM_SIZE }}
    />

    <Button
      text="Custom Button"
      onPress={callback}
      wrapperStyle={{
        marginBottom: theme.variables.MEDIUM_SIZE * 2,
        backgroundColor: 'tomato',
        borderRadius: 8,
      }}
    />

    <ReButton
      variant="filled"
      text="ReasonML Button"
      onPress={callback}
      wrapperStyle={{
        marginBottom: theme.variables.MEDIUM_SIZE,
        backgroundColor: 'rgb(212, 67, 58)',
      }}
    />
    <ReButton
      variant="filled"
      text="ReasonML Button"
      onPress={callback}
      loading
      wrapperStyle={{
        marginBottom: theme.variables.MEDIUM_SIZE,
        backgroundColor: 'rgb(212, 67, 58)',
      }}
    />
    <ReButton
      variant="outlined"
      text="ReasonML Button"
      onPress={callback}
      wrapperStyle={{
        borderColor: 'rgb(212, 67, 58)',
        marginBottom: theme.variables.MEDIUM_SIZE,
      }}
      textStyle={{
        color: 'rgb(212, 67, 58)',
      }}
    />
  </ScrollView>
);

export default injectTheme(ButtonScreen);
