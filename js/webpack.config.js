const webpack = require('webpack');
const path = require('path');

module.exports = {
  mode: 'production',
  output: {
    path: path.join(__dirname, '..', 'inst', 'www'),
    filename: 'blueprint.min.js',
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'],
      },
    ],
  },
  externals: {
    'react': 'jsmodule["react"]',
    'react-dom': 'jsmodule["react-dom"]',
    '@/shiny.react': 'jsmodule["@/shiny.react"]',
  },
  performance: {
    maxAssetSize: 2097152, // 2 MiB
    maxEntrypointSize: 2097152, // 2 MiB
  },
};
