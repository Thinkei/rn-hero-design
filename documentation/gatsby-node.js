exports.onCreateWebpackConfig = ({ actions }) => {
  actions.setWebpackConfig({
    resolve: {
      alias: {
        'react-native': 'react-native-web',
        'react-native-svg':
          '@rn-hero-design/documentation/mocks/react-native-svg-web',
        'react-native-safe-area-view':
          '@rn-hero-design/documentation/mocks/react-native-safe-area-view',
        'react-redux': '@rn-hero-design/documentation/mocks/react-redux',
        'react-native-webview':
          '@rn-hero-design/documentation/mocks/react-native-webview',
      },
    },
  });
};
