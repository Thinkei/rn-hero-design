import React from 'react';
import { View } from 'react-native';
import { Message } from 'rn-hero-design';

const MessageScreen = () => (
  <View>
    <Message variant="error" content="Error message" />
    <Message variant="warning" content="Warning message" />
    <Message variant="success" content="Success message" />
    <Message
      variant="info"
      content="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis feugiat magna, a viverra orci."
    />
  </View>
);

export default MessageScreen;
