import React, { useState } from 'react';
import { View, TouchableOpacity } from 'react-native';
import { Container, Select, TextInput } from 'rn-hero-design';

const noop = () => {};

const languages = [
  { label: 'Tiếng Việt', value: 'vi' },
  { label: 'English', value: 'en' },
  { label: 'Deutsch', value: 'de' },
  { label: 'Español', value: 'es' },
  { label: 'Français', value: 'fr' },
  { label: '日本語', value: 'ja' },
  { label: '한국어', value: 'ko' },
  { label: 'Bahasa Melayu', value: 'ms' },
  { label: 'Русский', value: 'ru' },
  { label: 'ไทย', value: 'th' },
  { label: '中文', value: 'zh' },
];

const genders = [
  { label: 'Male', value: '1' },
  { label: 'Female', value: '0' },
  { label: 'Other', value: '2' },
];

const getLabelOfValue = (options, value) => {
  const selectedOption = options.find(option => option.value === value);
  return selectedOption ? selectedOption.label : '';
};

const SelectScreen = () => {
  const [language, setLanguage] = useState('');
  const [gender, setGender] = useState('');
  const [changingField, setChangingField] = useState(null);

  const fieldMap = {
    gender: {
      options: genders,
      value: gender,
      onChange: setGender,
    },
    language: {
      options: languages,
      value: language,
      onChange: setLanguage,
    },
    null: {
      options: [],
      value: '',
      onChange: noop,
    },
  };

  return (
    <>
      <Container fluid>
        <TextInput
          label="Email"
          value="toan.nguyen@employmenthero.com"
          rightIcon="email-outline"
          onChangeText={noop}
        />

        <TouchableOpacity onPress={() => setChangingField('gender')}>
          <View pointerEvents="none">
            <TextInput
              label="Gender"
              value={getLabelOfValue(genders, gender)}
              onChangeText={noop}
            />
          </View>
        </TouchableOpacity>

        <TouchableOpacity onPress={() => setChangingField('language')}>
          <View pointerEvents="none">
            <TextInput
              label="Language"
              value={getLabelOfValue(languages, language)}
              onChangeText={noop}
            />
          </View>
        </TouchableOpacity>
      </Container>

      <Select
        show={!!changingField}
        options={fieldMap[changingField].options}
        value={fieldMap[changingField].value}
        onChange={value => fieldMap[changingField].onChange(value)}
        onDismiss={() => setChangingField(null)}
      />
    </>
  );
};

export default SelectScreen;
