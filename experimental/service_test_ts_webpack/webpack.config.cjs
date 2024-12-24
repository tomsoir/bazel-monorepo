const path = require('path');

module.exports = {
  // Webpack entry point for the already transpiled JS
  entry: path.resolve(__dirname, 'dist', 'index.js'),
  output: {
    filename: 'webpack_build.js', // Output bundled file
    path: path.resolve(__dirname, 'dist'),
  },
  resolve: {
    extensions: ['.js'], // Resolve JavaScript files only
  },
  mode: 'production', // Set Webpack mode to production for optimization
};
