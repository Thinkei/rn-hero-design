import React from 'react';
import { Provider } from 'react-redux';
import { createStore } from 'redux';

import TextScreen from './Text';
import ButtonScreen from './Button';
import TextInputScreen from './TextInput';
import IconScreen from './Icon';
import LoginScreen from './LoginScreen';
import ListItemScreen from './ListItem';
import BottomButtonScreen from './BottomButton';
import ReBottomButtonScreen from './ReBottomButton';
import DateTimePickerScreen from './DateTimePicker';
import LeaveRequestScreen from './LeaveRequestScreen';
import CardScreen from './Card';
import SwitchScreen from './Switch';
import AvatarScreen from './Avatar';
import TabBarScreen from './TabBar';
import MessageScreen from './Message';
import SelectScreen from './Select';
import MentionTextInputScreen from './MentionTextInput';
import CalendarScreen from './Calendar';
import RadioScreen from './Radio';
import RichTextEditorScreen from './RichTextEditor';
import ButtonGroupScreen from './ButtonGroup';
import ErrorScreen from './ErrorScreen';
import ProfileScreen from './ProfileScreen';
import darkKnightTheme from 'rn-hero-design/src/themes/dark-knight';

const store = createStore(state => state, { __theme: 'dark-knight' });
const DarkLeaveRequestScreen = () => (
  <Provider store={store}>
    <LeaveRequestScreen theme={darkKnightTheme} />
  </Provider>
);
DarkLeaveRequestScreen.navigationOptions = LeaveRequestScreen.navigationOptions;

export default {
  Text: {
    screen: TextScreen,
    defaultNavigationOptions: {
      title: 'Typo',
    },
  },
  Button: {
    screen: ButtonScreen,
    defaultNavigationOptions: {
      title: 'Button',
    },
  },
  BottomButton: {
    screen: BottomButtonScreen,
    defaultNavigationOptions: {
      title: 'BottomButton',
    },
  },
  ReBottomButtonScreen: {
    screen: ReBottomButtonScreen,
    defaultNavigationOptions: {
      title: '🐪 BottomButton',
    },
  },
  TextInput: {
    screen: TextInputScreen,
    defaultNavigationOptions: {
      title: 'TextInput',
    },
  },
  Icon: {
    screen: IconScreen,
    defaultNavigationOptions: {
      title: 'Icon',
    },
  },
  ListItem: {
    screen: ListItemScreen,
    defaultNavigationOptions: {
      title: 'ListItem',
    },
  },
  DateTimePicker: {
    screen: DateTimePickerScreen,
    defaultNavigationOptions: {
      title: 'DateTimePicker',
    },
  },
  Card: {
    screen: CardScreen,
    defaultNavigationOptions: {
      title: 'Card',
    },
  },
  Switch: {
    screen: SwitchScreen,
    defaultNavigationOptions: {
      title: 'Switch',
    },
  },
  Avatar: {
    screen: AvatarScreen,
    defaultNavigationOptions: {
      title: 'Avatar',
    },
  },
  TabBar: {
    screen: TabBarScreen,
    defaultNavigationOptions: {
      title: 'TabBar',
    },
  },
  Message: {
    screen: MessageScreen,
    defaultNavigationOptions: {
      title: 'Message',
    },
  },
  Select: {
    screen: SelectScreen,
    defaultNavigationOptions: {
      title: 'Select',
    },
  },
  MentionTextInput: {
    screen: MentionTextInputScreen,
    defaultNavigationOptions: {
      title: 'MentionTextInput',
    },
  },
  Calendar: {
    screen: CalendarScreen,
    defaultNavigationOptions: {
      title: 'Calendar',
    },
  },
  Radio: {
    screen: RadioScreen,
    defaultNavigationOptions: {
      title: 'Radio',
    },
  },
  RichTextEditor: {
    screen: RichTextEditorScreen,
    defaultNavigationOptions: {
      title: 'RichTextEditor',
    },
  },
  ButtonGroup: {
    screen: ButtonGroupScreen,
    defaultNavigationOptions: {
      title: 'ButtonGroup',
    },
  },
  ErrorScreen: {
    screen: ErrorScreen,
    defaultNavigationOptions: {
      title: 'ErrorScreen',
    },
  },
  ProfileScreen: {
    screen: ProfileScreen,
    defaultNavigationOptions: {
      title: 'Profile Screen',
    },
  },
  LoginScreen: {
    screen: LoginScreen,
    defaultNavigationOptions: {
      title: '🥑 Login Screen',
    },
  },
  LeaveRequestScreen: {
    screen: LeaveRequestScreen,
    defaultNavigationOptions: {
      title: '🍉 Leave Request Screen',
    },
  },
  DarkLeaveRequestScreen: {
    screen: DarkLeaveRequestScreen,
    defaultNavigationOptions: {
      title: '🌒 Dark Leave Request Screen',
    },
  },
};
