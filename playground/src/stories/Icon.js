import React from 'react';
import { StyleSheet } from 'react-native';
import { Icon, Container } from 'rn-hero-design';

const IconScreen = () => (
  <>
    <Container direction="row" style={styles.container}>
      <Icon icon="email" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="eye" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="eye-invisible" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="ok-circle" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="calendar" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="more-vertical" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="warning-circle" size={24} wrapperStyle={styles.iconWrapper} />
    </Container>
    <Container direction="row" style={styles.container}>
      <Icon icon="email-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="eye-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon
        icon="eye-invisible-outline"
        size={24}
        wrapperStyle={styles.iconWrapper}
      />
      <Icon icon="cancel-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon
        icon="clock-circle-outline"
        size={24}
        wrapperStyle={styles.iconWrapper}
      />
      <Icon
        icon="comment-outline"
        size={24}
        wrapperStyle={styles.iconWrapper}
      />
      <Icon
        icon="plus-circle-outline"
        size={24}
        wrapperStyle={styles.iconWrapper}
      />
      <Icon icon="plus-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon
        icon="piggy-bank-outline"
        size={24}
        wrapperStyle={styles.iconWrapper}
      />
      <Icon icon="target-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon
        icon="single-right-outline"
        size={24}
        wrapperStyle={styles.iconWrapper}
      />
      <Icon
        icon="calendar-outline"
        size={24}
        wrapperStyle={styles.iconWrapper}
      />
      <Icon icon="phone-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="face-id" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="arrow-down" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="camera-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="paperclip" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="image-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon icon="file-outline" size={24} wrapperStyle={styles.iconWrapper} />
      <Icon
        icon="warning-circle-outline"
        size={24}
        wrapperStyle={styles.iconWrapper}
      />
    </Container>
  </>
);

const styles = StyleSheet.create({
  container: {
    flexWrap: 'wrap',
    paddingBottom: 0,
  },
  iconWrapper: {
    width: 48,
    height: 48,
  },
});

export default IconScreen;
