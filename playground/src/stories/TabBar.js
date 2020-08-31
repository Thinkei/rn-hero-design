import React from 'react';
import { ActivityIndicator } from 'react-native';
import { ReTabBar, Text, Container, injectTheme, ReIcon } from 'rn-hero-design';

const LazyView = ({ content }) => {
  const [isLoading, setIsLoading] = React.useState(true);

  React.useEffect(() => {
    setTimeout(() => {
      setIsLoading(false);
    }, 3000);
  });

  return (
    <Container>
      {isLoading ? <ActivityIndicator size="large" /> : <Text>{content}</Text>}
    </Container>
  );
};

const TabBarScreen = ({ theme }) => {
  let [selectedIndex, setSelectedIndex] = React.useState(0);

  return (
    <ReTabBar
      selectedIndex={selectedIndex}
      onSelect={index => setSelectedIndex(index)}
      contentStyle={{ backgroundColor: '#eee' }}
    >
      <ReTabBar.Tab
        title={
          <Text
            weight="600"
            color={
              selectedIndex === 0
                ? theme.variables.PRIMARY_COLOR
                : theme.variables.TEXT_COLOR
            }
          >
            Tab 1
          </Text>
        }
      >
        <LazyView content="Nhìn cũng ok" />
      </ReTabBar.Tab>
      <ReTabBar.Tab
        title={
          <Text
            weight="600"
            color={
              selectedIndex === 1
                ? theme.variables.PRIMARY_COLOR
                : theme.variables.TEXT_COLOR
            }
          >
            Tab 2
          </Text>
        }
      >
        <LazyView content="Nhìn cũng được" />
      </ReTabBar.Tab>
      <ReTabBar.Tab
        title={
          <ReIcon
            icon="email"
            size={24}
            color={
              selectedIndex === 2
                ? theme.variables.PRIMARY_COLOR
                : theme.variables.TEXT_COLOR
            }
          />
        }
      >
        <LazyView content="Nhìn cũng tạm" />
      </ReTabBar.Tab>
    </ReTabBar>
  );
};

export default injectTheme(TabBarScreen);
