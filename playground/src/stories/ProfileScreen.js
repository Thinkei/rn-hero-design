import React from 'react';
import { View } from 'react-native';
import {
  Avatar,
  Container,
  Text,
  ListItem,
  Icon,
  injectTheme,
} from 'rn-hero-design';
import { FOCUS_BLUE_1, WHITE } from 'rn-hero-design/src/themes/hero/variables';

const ProfileScreen = ({ theme }) => (
  <View>
    <Container
      style={{
        alignItems: 'center',
        borderBottomWidth: 0.8,
        borderBottomColor: theme.variables.BORDER_COLOR,
      }}
    >
      <Avatar
        size="large"
        title="TN"
        wrapperStyle={{ marginVertical: theme.variables.MEDIUM_SIZE }}
      />
      <Text size="h1">Toan Nguyen</Text>
      <Text size="h2" color={theme.variables.MUTED_TEXT_COLOR}>
        Software Engineer
      </Text>

      <View
        style={{
          alignItems: 'center',
          marginTop: theme.variables.LARGE_SIZE + theme.variables.MEDIUM_SIZE,
          marginBottom: theme.variables.LARGE_SIZE,
        }}
      >
        <Text color={theme.variables.MUTED_TEXT_COLOR}>
          Sorry, Overview is not available at this time.
        </Text>
        <Text
          color={theme.variables.PRIMARY_COLOR}
          style={{ marginTop: theme.variables.SMALL_SIZE }}
        >
          Try again
        </Text>
      </View>
    </Container>

    <Container style={{ paddingTop: 0 }}>
      <ListItem
        title="Personal Details"
        rightElement={
          <Icon
            icon="single-right-outline"
            color={theme.variables.MUTED_TEXT_COLOR}
            size={16}
          />
        }
        titleStyle={{ fontWeight: '400' }}
        wrapperStyle={{ minHeight: 0, paddingHorizontal: 0 }}
      />
      <ListItem
        title="Employment History"
        rightElement={
          <Icon
            icon="single-right-outline"
            color={theme.variables.MUTED_TEXT_COLOR}
            size={16}
          />
        }
        titleStyle={{ fontWeight: '400' }}
        wrapperStyle={{ minHeight: 0, paddingHorizontal: 0 }}
      />
    </Container>
  </View>
);

ProfileScreen.navigationOptions = {
  title: 'Profile',
  headerStyle: {
    backgroundColor: FOCUS_BLUE_1,
    borderBottomWidth: 0,
  },
  headerTitleStyle: {
    color: WHITE,
  },
};

export default injectTheme(ProfileScreen);
