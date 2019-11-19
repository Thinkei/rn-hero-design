import React from 'react';
import { View, StyleSheet } from 'react-native';
import { Icon } from 'rn-hero-design';

const IconScreen = () => (
  <>
    <View style={styles.container}>
      <Icon icon="email" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="eye" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="eye-invisible" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="ok-circle" size={24} wrapperStyle={styles.iconWrapper} />
    </View>
    <View style={styles.container}>
      <Icon icon="email-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="eye-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon
        icon="eye-invisible-outline"
        size={24}
        wrapperStyle={styles.iconWrapper}
      />
    </View>
  </>
);

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    padding: 16,
    paddingBottom: 0,
  },
  iconWrapper: {
    width: 48,
    height: 48,
  },
});

export default IconScreen;
