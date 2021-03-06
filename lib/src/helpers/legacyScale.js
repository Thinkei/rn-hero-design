import { Dimensions } from 'react-native';

const IP6_WIDTH = 375;
const IP6_HEIGHT = 667;
const { height, width } = Dimensions.get('window');

const scaleByWidth = (size, baseWidth = IP6_WIDTH) =>
  Math.floor((width / baseWidth) * size);

const scaleByHeight = (size, baseHeight = IP6_HEIGHT) =>
  Math.floor((height / baseHeight) * size);

const scale = size => {
  const phoneRatio = height / width;
  if (phoneRatio > 1.6) return scaleByWidth(size);
  return scaleByHeight(size);
};

export { scaleByWidth, scaleByHeight };
export default scale;
