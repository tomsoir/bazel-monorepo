const path = require('path');

module.exports = {
  // Webpack entry point for the already transpiled JS
  entry: path.resolve(__dirname, 'dist', 'index.js'),
  output: {
    filename: 'webpack_build.js', // Output bundled file
    path: path.resolve(__dirname, 'dist'),
  },
  resolve: {
    extensions: ['.js', '.jsx'],
  },
  // mode: 'production', // Set Webpack mode to production for optimization
  mode: 'development', // Set mode to development for faster builds during dev
  devServer: {
    open: true, // Open browser automatically
    hot: true, // Enable Hot Module Replacement (HMR)
    static: {
      directory: path.resolve(__dirname, 'dist'),
    },
    port: 8080,
  },
};
