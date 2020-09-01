import resolve from 'rollup-plugin-node-resolve';
import commonjs from 'rollup-plugin-commonjs';
import babel from 'rollup-plugin-babel';

export default {
  input: 'src/index',
  output: {
    file: 'lib.js',
    format: 'esm',
  },
  plugins: [
    resolve({
      preferBuiltins: false,
    }),
    babel({
      exclude: /node_modules\/(?!react-native-safe-area-view).*/,
      babelrc: false,
      presets: ['@babel/preset-react', '@babel/preset-flow'],
      plugins: [
        '@babel/plugin-proposal-class-properties',
        [
          'babel-plugin-inline-import',
          {
            extensions: ['.svg', 'hero-editor/dist/app.js'],
          },
        ],
      ],
    }),
    commonjs(),
  ],
  external: [
    'prop-types',
    'react',
    'react-native',
    'react-native-svg',
    'react-redux',
    'react-native-webview',
  ],
};
