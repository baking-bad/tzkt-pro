const path = require('path');

const mode = process.env.NODE_ENV === 'production' ? 'production' : 'development';

module.exports = {
  mode: mode,
  entry: {
    'graphqli-explorer-page': './src/graphqli-explorer-page.jsx'
  },
  output: {
    filename: './build/js/[name].js',
    path: path.resolve('docs')
  },
  resolve: {
    extensions: ['.mjs', '.jsx', '.js', '.css']
  },
  module: {
    rules: [
      {
        exclude: /node_modules/,
        test: /\.jsx?$/,
        loader: 'babel-loader'
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader']
      }
    ]
  }
};
