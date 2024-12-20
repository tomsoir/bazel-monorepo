const path = require('path');

module.exports = {
  // Webpack entry point for the already transpiled JS
  // entry: './experimental/service_test_ts_webpack/dist/index.js',
  entry: path.resolve(__dirname, 'dist', 'index.js'),

  output: {
    filename: 'bundle1112.js',  // Output bundled file
    path: path.resolve(__dirname, 'dist'),
    // path: './dist',
    // path: path.resolve(__dirname, 'dist'),  // Output directory
  },
  resolve: {
    extensions: ['.js'],  // Resolve JavaScript files only
  },
  mode: 'production',  // Set Webpack mode to production for optimization
};
