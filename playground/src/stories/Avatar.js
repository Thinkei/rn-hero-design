import React from 'react';
import { ScrollView } from 'react-native';
import { ReAvatar, injectTheme } from 'rn-hero-design';

const AvatarScreen = ({ theme }) => (
  <ScrollView>
    <ReAvatar
      size="medium"
      title="HV"
      wrapperStyle={{
        marginTop: theme.variables.MEDIUM_SIZE,
        marginLeft: theme.variables.MEDIUM_SIZE,
      }}
    />
    <ReAvatar
      size="medium"
      title="HV"
      source="https://avatars0.githubusercontent.com/u/17645203?s=400&v=4"
      wrapperStyle={{
        marginTop: theme.variables.MEDIUM_SIZE,
        marginLeft: theme.variables.MEDIUM_SIZE,
      }}
    />
    <ReAvatar
      size="large"
      title="HV"
      wrapperStyle={{
        marginTop: theme.variables.MEDIUM_SIZE,
        marginLeft: theme.variables.MEDIUM_SIZE,
      }}
    />
    <ReAvatar
      size="large"
      title="HV"
      source="https://avatars0.githubusercontent.com/u/17645203?s=400&v=4"
      wrapperStyle={{
        marginTop: theme.variables.MEDIUM_SIZE,
        marginLeft: theme.variables.MEDIUM_SIZE,
      }}
    />
  </ScrollView>
);

export default injectTheme(AvatarScreen);
