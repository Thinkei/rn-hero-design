import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  FlatList,
  StyleSheet,
} from 'react-native';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';
import * as Font from 'expo-font';
import routes from './stories/routes';

const menuData = Object.keys(routes).map(route => ({
  title: routes[route].defaultNavigationOptions.title || route,
  route,
}));

const HomeScreen = ({ navigation }) => (
  <View style={styles.container}>
    <FlatList
      data={menuData}
      renderItem={({ item }) => (
        <ListItem
          title={item.title}
          onPress={() => navigation.navigate(item.route)}
        />
      )}
      keyExtractor={item => item.title}
    />
  </View>
);

const ListItem = ({ title, onPress }) => (
  <TouchableOpacity onPress={onPress} style={styles.item}>
    <Text style={styles.itemText}>{title}</Text>
  </TouchableOpacity>
);

const AppNavigator = createStackNavigator(
  {
    Home: {
      screen: HomeScreen,
      navigationOptions: {
        title: '👓 RN Hero Design',
        headerBackTitle: null,
      },
    },
    ...routes,
  },
  {
    initialRouteName: 'Home',
  },
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  item: {
    padding: 16,
    borderBottomColor: 'grey',
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
  itemText: {
    fontSize: 16,
    textAlign: 'center',
  },
});

const AppContainer = createAppContainer(AppNavigator);

const store = createStore(state => state, { __theme: undefined });

export default () => {
  const [fontLoaded, setFontLoaded] = useState(false);

  useEffect(() => {
    Font.loadAsync({
      'Proxima Nova': require('./assets/fonts/ProximaNova-Regular.otf'),
    }).then(() => {
      setFontLoaded(true);
    });
  }, []);

  if (!fontLoaded) return null;

  return (
    <Provider store={store}>
      <AppContainer />
    </Provider>
  );
};
