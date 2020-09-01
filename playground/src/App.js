import 'react-native-gesture-handler';
import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import { createStore } from 'redux';
import { Provider } from 'react-redux';

import { View, FlatList } from 'react-native';
import { ListItem } from 'rn-hero-design';

import routes from './stories/routes';

const menuData = Object.keys(routes).map(name => ({
  title: name,
  screen: routes[name].screen,
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
      keyExtractor={item => item.title}
    />
  </View>
);

const Stack = createStackNavigator();

const store = createStore(state => state, { __theme: undefined });

const App = () => (
  <Provider store={store}>
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="RN Hero Design" component={HomeScreen} />
        {menuData.map(({ title, screen }) => (
          <Stack.Screen key={title} name={title} component={screen} />
        ))}
      </Stack.Navigator>
    </NavigationContainer>
  </Provider>
);

export default App;
