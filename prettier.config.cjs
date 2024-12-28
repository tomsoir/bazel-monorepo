/**
 * @see https://prettier.io/docs/en/configuration.html
 */
const config = {
  tabWidth: 2,
  singleQuote: true,
  plugins: [require('prettier-plugin-sql')],
};

module.exports = config;
