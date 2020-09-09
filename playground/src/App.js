import 'react-native-gesture-handler';
import * as React from 'react';
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import { NavigationContainer, DefaultTheme } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { View, FlatList } from 'react-native';
import { ListItem, injectTheme } from 'rn-hero-design';

import routes from './stories/routes';

const menuData = Object.keys(routes).map((name) => ({
  title: name,
  screen: routes[name].screen,
  options: routes[name].options,
}));

const HomeScreen = ({ navigation }) => (
  <View style={{ flex: 1 }}>
    <FlatList
      data={menuData}
      renderItem={({ item }) => (
        <ListItem
          title={item.title}
          onPress={() => navigation.navigate(item.title)}
          wrapperStyle={{ minHeight: 0 }}
        />
      )}
      keyExtractor={(item) => item.title}
    />
  </View>
);

const Stack = createStackNavigator();

const App = injectTheme(({ theme }) => {
  const CustomTheme = React.useMemo(
    () => ({
      ...DefaultTheme,
      colors: {
        ...DefaultTheme.colors,
        background: theme.variables.BACKGROUND_COLOR,
      },
    }),
    [theme.variables.BACKGROUND_COLOR],
  );

  return (
    <NavigationContainer theme={CustomTheme}>
      <Stack.Navigator>
        <Stack.Screen name="RN Hero Design" component={HomeScreen} />
        {menuData.map(({ title, screen, options }) => (
          <Stack.Screen
            key={title}
            name={title}
            component={screen}
            options={options}
          />
        ))}
      </Stack.Navigator>
    </NavigationContainer>
  );
});

const store = createStore((state) => state, { __theme: undefined });

export default () => (
  <Provider store={store}>
    <App />
  </Provider>
);
