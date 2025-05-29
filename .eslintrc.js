// .eslintrc.js

module.exports = {
  root: true,
  ignorePatterns: [
    '**/package.json',
    'experimental/service_test_ts_rspack_react_tests_assets_swc/package.json',
    '**/*.json',
    'experimental/service_test_ts_webpack_react_tests/**',
  ],
  overrides: [
    {
      files: ['**/*.ts', '**/*.tsx'],
      parser: '@typescript-eslint/parser',
      parserOptions: {
        project: true, // requires tsconfig.json in appropriate places
        tsconfigRootDir: __dirname,
      },
      plugins: ['@typescript-eslint'],
      extends: [
        'eslint:recommended',
        'plugin:@typescript-eslint/recommended-type-checked',
        'plugin:@typescript-eslint/stylistic-type-checked',
      ],
      rules: {
        '@typescript-eslint/no-redundant-type-constituents': 'error',
        'sort-imports': 'off',
        'no-debugger': 'off',
        '@typescript-eslint/no-unsafe-call': 'off',
        '@typescript-eslint/no-unsafe-assignment': 'off',
        '@typescript-eslint/no-unused-expressions': 'off',
      },
    },
    {
      files: ['**/*.mjs', '**/*.cjs', '**/*.js'],
      extends: ['eslint:recommended'],
      rules: {
        'no-undef': 'off',
      },
    },
  ],
};
