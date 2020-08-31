import React from 'react';
import { View, Image, StyleSheet } from 'react-native';
import { ListItem, ReListItem, Icon } from 'rn-hero-design';
import {
  FOCUS_BLUE_1,
  LARGE_SIZE,
  MEDIUM_SIZE,
} from 'rn-hero-design/src/themes/hero/variables';

const ListItemScreen = () => (
  <View>
    <ListItem title="Huy Vo" />
    <ListItem title="Huy Vo" subtitle="Bug creator" />
    <ListItem
      title="Huy Vo"
      subtitle="The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking."
      leftElement={
        <Avatar uri="https://avatars0.githubusercontent.com/u/17645203?s=400&v=4" />
      }
    />
    <ListItem
      title="Huy Vo"
      onPress={noop}
      rightElement={<Icon icon="ok-circle" color={FOCUS_BLUE_1} />}
    />
    <ListItem
      title="Huy Vo"
      subtitle="Bug creator"
      onPress={noop}
      rightElement={<Icon icon="ok-circle" color={FOCUS_BLUE_1} />}
    />
    <ListItem
      title="Huy Vo"
      subtitle="Bug creator"
      onPress={noop}
      rightElement={<Icon icon="ok-circle" color={FOCUS_BLUE_1} />}
      leftElement={
        <Avatar uri="https://avatars0.githubusercontent.com/u/17645203?s=400&v=4" />
      }
    />
    <ReListItem
      title="🐪 Huy Vo"
      subtitle="Bug creator"
      onPress={noop}
      rightElement={<Icon icon="ok-circle" color={FOCUS_BLUE_1} />}
      leftElement={
        <Avatar uri="https://avatars0.githubusercontent.com/u/17645203?s=400&v=4" />
      }
    />
  </View>
);

const Avatar = ({ uri }) => <Image style={styles.avatar} source={{ uri }} />;

const noop = () => {};

const styles = StyleSheet.create({
  avatar: {
    width: LARGE_SIZE * 2,
    height: LARGE_SIZE * 2,
    borderRadius: LARGE_SIZE,
    marginRight: MEDIUM_SIZE,
  },
});

export default ListItemScreen;
