const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  mode: 'development', // or "production"
  // Since the TypeScript has already been transpiled
  // to JS (by :tsc target) we are checking /dist folder
  entry: path.resolve(__dirname, 'dist', 'index.js'),
  output: {
    filename: 'rspack_build.js', // Output bundled file
    path: path.resolve(__dirname, 'dist'),
    clean: true
  },
  resolve: {
    extensions: ['.js', '.jsx']
  },
  devtool: 'source-map',
  module: {
    rules: [
      {
        test: /\.(svg|png)$/,
        type: 'asset/resource'
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.resolve(__dirname, 'dist', 'index.html')
    })
  ],
  devServer: {
    open: true,
    hot: true,
    static: {
      directory: path.join(__dirname, 'dist')
    },
    port: 8080
  }
};
