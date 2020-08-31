import React from 'react';
import { ScrollView, StyleSheet } from 'react-native';
import {
  TextInput,
  BottomButton,
  Text,
  KeyboardAvoidingView,
  ReTextInput,
} from 'rn-hero-design';

const noop = () => {};

const TextInputScreen = () => (
  <KeyboardAvoidingView withNavigation style={styles.keyboardAvoidingView}>
    <ScrollView contentContainerStyle={styles.container}>
      <ReTextInput
        label="Email"
        value="toan.nguyen@employmenthero.com"
        rightIcon="email-outline"
        onChangeText={noop}
      />

      <TextInput
        keyboardType="numeric"
        label="Password"
        value="123456"
        rightIcon="eye-outline"
        onChangeText={noop}
        secureTextEntry
      />

      <TextInput
        keyboardType="numeric"
        label="Confirm password"
        value="12345"
        rightIcon="eye-outline"
        onChangeText={noop}
        secureTextEntry
        error="Password not matched"
        wrapperStyle={{ marginBottom: 32 }}
      />

      <TextInput label="Region" value="Vietnam" disabled onChangeText={noop} />

      <Text size="h5">* By sign-up, you agree to our terms and conditions</Text>
    </ScrollView>

    <BottomButton text="Register" onPress={() => {}} />
  </KeyboardAvoidingView>
);

const styles = StyleSheet.create({
  keyboardAvoidingView: {
    flex: 1,
  },
  container: {
    padding: 16,
  },
});

export default TextInputScreen;
