/**
 * @see https://prettier.io/docs/en/configuration.html
 */
const config = {
  tabWidth: 2,
  singleQuote: true,
  // @TODO disabled to fix :format target
  // Note: Uncomment also SQL in tools/format/BUILD.bazel
  // plugins: [require('prettier-plugin-sql')],
};

module.exports = config;
