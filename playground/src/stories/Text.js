import React from 'react';
import { ScrollView } from 'react-native';
import { Text, ReText } from 'rn-hero-design';

const TextScreen = () => (
  <ScrollView>
    <Text size="h1" style={{ marginBottom: 16 }}>
      🐔 The quick brown fox
    </Text>
    <Text size="h2" style={{ marginBottom: 16 }}>
      🐔 The quick brown fox
    </Text>
    <Text size="h3" style={{ marginBottom: 16 }}>
      🐔 The quick brown fox
    </Text>
    <Text style={{ marginBottom: 16 }}>🐔 The quick brown fox</Text>
    <Text weight="500" style={{ marginBottom: 16 }}>
      🐔 The quick brown fox
    </Text>
    <Text weight="600" style={{ marginBottom: 16 }}>
      🐔 The quick brown fox
    </Text>
    <Text weight="700" style={{ marginBottom: 32 }}>
      🐔 The quick brown fox
    </Text>

    <ReText size={'h1'} style={{ marginBottom: 16 }}>
      🐪 The quick brown fox
    </ReText>
    <ReText size={'h2'} style={{ marginBottom: 16 }}>
      🐪 The quick brown fox
    </ReText>
    <ReText size={'h3'} style={{ marginBottom: 16 }}>
      🐪 The quick brown fox
    </ReText>
    <ReText style={{ marginBottom: 16 }}>🐪 The quick brown fox</ReText>
    <ReText weight={'500'} style={{ marginBottom: 16 }}>
      🐪 The quick brown fox
    </ReText>
    <ReText weight={'600'} style={{ marginBottom: 16 }}>
      🐪 The quick brown fox
    </ReText>
    <ReText weight={'700'} style={{ marginBottom: 32 }}>
      🐪 The quick brown fox
    </ReText>

    <ReText
      numberOfLines={1}
      ellipsizeMode="middle"
      style={{ marginBottom: 16 }}
    >
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
      cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
      est laborum.
    </ReText>
  </ScrollView>
);

export default TextScreen;
