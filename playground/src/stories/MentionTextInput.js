import React from 'react';
import { View, FlatList, ScrollView, TouchableOpacity } from 'react-native';
import {
  Text,
  Container,
  ListItem,
  Avatar,
  TextInput,
  MentionTextInput,
  KeyboardAvoidingView,
  BottomButton,
  injectTheme,
} from 'rn-hero-design';
import { FOCUS_BLUE_1, WHITE } from 'rn-hero-design/src/themes/hero/variables';

const suggestionData = [
  { id: '1', name: 'Tuan Mai', job: 'Team leader' },
  {
    id: '2',
    name: 'Huy Vo',
    job: 'Bug creator',
    avatar: 'https://avatars0.githubusercontent.com/u/17645203?s=400&v=4',
  },
  { id: '3', name: 'Gia Toan', job: 'Mobile developer' },
  { id: '4', name: 'Kien Tran', job: 'Mobile developer' },
  { id: '5', name: 'Hieu Pham', job: 'Web developer' },
  {
    id: '6',
    name: 'ReasonML',
    job: 'Functional language',
    avatar: 'https://avatars3.githubusercontent.com/u/20414525?s=400&v=4',
  },
];

const noop = () => {};

const isEmpty = array => array.length === 0;

const getAcronym = string => string.match(/\b\w/g).join('');

const MentionTextInputScreen = ({ theme }) => {
  const [value, setValue] = React.useState([]);

  return (
    <>
      <KeyboardAvoidingView
        withNavigation
        style={{ flex: 1, backgroundColor: theme.variables.BACKGROUND_COLOR }}
      >
        <ScrollView
          keyboardShouldPersistTaps="handled"
          contentContainerStyle={{ padding: theme.variables.MEDIUM_SIZE }}
        >
          <ListItem
            title="Toan Nguyen"
            subtitle="YOLO"
            leftElement={
              <Avatar
                size="medium"
                title="TN"
                wrapperStyle={{ marginRight: theme.variables.MEDIUM_SIZE }}
              />
            }
            wrapperStyle={{ paddingHorizontal: 0, borderBottomWidth: 0 }}
          />

          <TouchableOpacity onPress={noop}>
            <View pointerEvents="none">
              <TextInput
                rightIcon="eye-outline"
                value="Share to everyone"
                onChangeText={noop}
                wrapperStyle={{ marginBottom: 0 }}
              />
            </View>
          </TouchableOpacity>

          <MentionTextInput
            placeholder="Has someone brightened up your day? Type @ to give them a Shout Out!"
            rightIcon="comment-outline"
            value={value}
            autoFocus
            onChange={value => setValue(value)}
            renderSuggestionList={(searchValue, onSelect) => (
              <SuggestionList searchValue={searchValue} onSelect={onSelect} />
            )}
          />
        </ScrollView>
      </KeyboardAvoidingView>

      <BottomButton text="Send" onPress={noop} disabled={isEmpty(value)} />
    </>
  );
};

const SuggestionList = injectTheme(({ searchValue, onSelect, theme }) => {
  const searchResult = suggestionData.filter(({ name }) =>
    name.toLowerCase().includes(searchValue.toLowerCase()),
  );

  if (isEmpty(searchResult)) {
    return (
      <Container
        direction="row"
        style={{
          alignItems: 'center',
          justifyContent: 'center',
          height: theme.variables.LARGE_SIZE + theme.variables.SMALL_SIZE * 2,
          paddingVertical: 0,
        }}
      >
        <Text size="h5" weight="500" color={theme.variables.MUTED_TEXT_COLOR}>
          No result
        </Text>
      </Container>
    );
  }

  return (
    <FlatList
      keyboardShouldPersistTaps="handled"
      data={searchResult}
      keyExtractor={item => item.id}
      renderItem={({ item: { id, name, job, avatar } }) => (
        <SuggestionItem
          name={name}
          job={job}
          avatar={avatar}
          onPress={() => onSelect(id, name)}
        />
      )}
    />
  );
});

const SuggestionItem = injectTheme(({ name, job, avatar, onPress, theme }) => (
  <TouchableOpacity onPress={onPress}>
    <Container
      direction="row"
      style={{
        alignItems: 'center',
        paddingVertical: theme.variables.SMALL_SIZE,
      }}
    >
      <Avatar
        size="small"
        title={getAcronym(name)}
        source={avatar}
        wrapperStyle={{ marginRight: theme.variables.MEDIUM_SIZE }}
      />
      <Text
        size="h5"
        weight="500"
        style={{ marginRight: theme.variables.MEDIUM_SIZE }}
      >
        {name}
      </Text>
      <Text size="h5" weight="500" color={theme.variables.MUTED_TEXT_COLOR}>
        {job}
      </Text>
    </Container>
  </TouchableOpacity>
));

MentionTextInputScreen.navigationOptions = {
  title: 'Give a Shout Out',
  headerStyle: {
    backgroundColor: FOCUS_BLUE_1,
    borderBottomWidth: 0,
  },
  headerTitleStyle: {
    color: WHITE,
  },
};

export default injectTheme(MentionTextInputScreen);
