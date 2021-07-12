import themeManager from './helpers/themeManager';
import injectTheme from './helpers/injectTheme';
import { useTheme } from './bindings/Helpers.bs';

import Button, { make as BaseButton } from './components/Button.gen';
import Text, { make as BaseText } from './components/Text.gen';
import ListItem, { make as BaseListItem } from './components/ListItem.gen';
import Icon, { make as BaseIcon } from './components/Icon.gen';
import TextInput, { make as BaseTextInput } from './components/TextInput.gen';
import Switch, { make as BaseSwitch } from './components/Switch.gen';
import Avatar, { make as BaseAvatar } from './components/Avatar.gen';
import BottomButton, {
  make as BaseBottomButton,
} from './components/BottomButton.gen';
import DateTimePicker, {
  make as BaseDateTimePicker,
} from './components/DateTimePicker.gen';
import TabBar, { make as BaseTabBar } from './components/TabBar.gen';
import Card, { make as BaseCard } from './components/Card.gen';
import KeyboardAvoidingView, {
  make as BaseKeyboardAvoidingView,
} from './components/KeyboardAvoidingView.gen';
import Container, { make as BaseContainer } from './components/Container.gen';
import Message, { make as BaseMessage } from './components/Message.gen';
import Select, { make as BaseSelect } from './components/Select.gen';
import MentionTextInput, {
  make as BaseMentionTextInput,
} from './components/MentionTextInput.gen';
import Calendar, { make as BaseCalendar } from './components/Calendar.gen';
import Radio, { make as BaseRadio } from './components/Radio.gen';
import RichTextEditor, {
  make as BaseRichTextEditor,
} from './components/RichTextEditor.gen';
import ButtonGroup, {
  make as BaseButtonGroup,
} from './components/ButtonGroup.gen';
import ErrorScreen, {
  make as BaseErrorScreen,
} from './components/ErrorScreen.gen';
import Badge, { make as BaseBadge } from './components/Badge.gen';
import TouchableTextInput, {
  make as BaseTouchableTextInput,
} from './components/TouchableTextInput.gen';
import PdfEditorPreview, {
  make as BasePdfEditorPreview,
} from './components/PdfEditor__Preview.gen';

export {
  //
  Text,
  Button,
  TextInput,
  Icon,
  ListItem,
  BottomButton,
  DateTimePicker,
  KeyboardAvoidingView,
  Container,
  Card,
  Switch,
  Avatar,
  TabBar,
  Message,
  Select,
  MentionTextInput,
  Calendar,
  Radio,
  RichTextEditor,
  ButtonGroup,
  ErrorScreen,
  Badge,
  TouchableTextInput,
  PdfEditorPreview,
  //
  BaseText,
  BaseButton,
  BaseTextInput,
  BaseIcon,
  BaseListItem,
  BaseBottomButton,
  BaseDateTimePicker,
  BaseKeyboardAvoidingView,
  BaseContainer,
  BaseCard,
  BaseSwitch,
  BaseAvatar,
  BaseTabBar,
  BaseMessage,
  BaseSelect,
  BaseMentionTextInput,
  BaseCalendar,
  BaseRadio,
  BaseRichTextEditor,
  BaseButtonGroup,
  BaseErrorScreen,
  BaseBadge,
  BaseTouchableTextInput,
  BasePdfEditorPreview,
  //
  themeManager,
  injectTheme,
  useTheme,
};
