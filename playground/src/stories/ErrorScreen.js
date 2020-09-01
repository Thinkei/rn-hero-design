import React from 'react';
import { ErrorScreen as ES, Text, Button, injectTheme } from 'rn-hero-design';

const ErrorScreen = ({ theme }) => (
  <ES
    onPressClose={() => {}}
    imageSource={require('../images/404_icon.png')}
    title={
      <Text size="h1" style={{ textAlign: 'center' }}>
        Oops! Something has been wrong
      </Text>
    }
    subtitle={
      <Text
        size="h4"
        color={theme.variables.MUTED_TEXT_COLOR}
        style={{ textAlign: 'center' }}>
        If you keep encounting this issue, please contact with our{' '}
        <Text weight="bold" color={theme.variables.MUTED_TEXT_COLOR}>
          Support team
        </Text>
      </Text>
    }
    actions={
      <>
        <Button
          text="Retry"
          wrapperStyle={{
            marginBottom: theme.variables.MEDIUM_SIZE,
          }}
        />
        <Button
          text="Back to dashboard"
          variant="outlined"
          wrapperStyle={{
            borderColor: 'transparent',
          }}
        />
      </>
    }
  />
);

export default injectTheme(ErrorScreen);
