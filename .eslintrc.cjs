module.exports = exports = {
  env: {
    browser: true,
    es2021: true,
    node: true,
    jest: true,
  },
  extends: [
    'eslint:recommended',
    // "plugin:@typescript-eslint/recommended",
  ],
  // "plugins": ["@typescript-eslint"],
  // "parser": "@typescript-eslint/parser",
  parserOptions: {
    ecmaVersion: 12,
    sourceType: 'module',
  },
  rules: {
    // '@typescript-eslint/no-unused-vars': ['error', { vars: 'all', args: 'after-used', ignoreRestSiblings: false }],
    indent: ['error', 2],
    quotes: ['error', 'single'],
    semi: ['error', 'always'],
    'no-unused-vars': [
      'error',
      { vars: 'all', args: 'after-used', ignoreRestSiblings: false },
    ],
    'no-console': ['warn'],
    eqeqeq: ['error', 'always'],
    curly: ['error', 'all'],
    'max-len': ['error', { code: 120 }],
    'comma-dangle': ['error', 'never'],
  },
  // overrides: [
  //   {
  //     files: ['*.json'],
  //     rules: {
  //       'no-unused-expressions': 'off',
  //       'no-unexpected-multiline': 'off',
  //     },
  //   },
  // ],
};

// ------------------------
// .eslintrc.js version
// ------------------------
// module.exports = exports = {
//   env: {
//     browser: true,
//     es2021: true,
//     node: true,
//     jest: true,
//   },
//   extends: ['eslint:recommended', 'typescript-eslint/recommended'],
//   plugins: ['typescript-eslint'],
//   parser: 'typescript-eslint/parser',

//   // parser: '@typescript-eslint/parser',
//   // parserOptions: {
//   //   ecmaVersion: 12,
//   //   sourceType: 'module',
//   //   ecmaFeatures: {
//   //     jsx: true
//   //   }
//   // },
//   // plugins: ['@typescript-eslint'],

//   // extends: ['plugin:typescript-eslint/recommended'],
//   // parser: 'typescript-eslint/parser',
//   // plugins: ['typescript-eslint'],

//   // "settings": {
//   //   "react": {
//   //     "version": 'detect'
//   //   }
//   // },

//   parserOptions: {
//     ecmaVersion: 12,
//     sourceType: 'module',
//   },
//   rules: {
//     indent: ['error', 2],
//     quotes: ['error', 'single'],
//     semi: ['error', 'always'],
//     'no-unused-vars': [
//       'error',
//       { vars: 'all', args: 'after-used', ignoreRestSiblings: false },
//     ],
//     // '@typescript-eslint/no-unused-vars': ['error', { vars: 'all', args: 'after-used', ignoreRestSiblings: false }],
//     'no-console': ['warn'],
//     eqeqeq: ['error', 'always'],
//     curly: ['error', 'all'],
//     'max-len': ['error', { code: 120 }],
//     'comma-dangle': ['error', 'never'],
//   },
//   overrides: [
//     {
//       files: ['*.json'],
//       parser: 'jsonc-eslint-parser',
//       rules: {
//         'no-unused-expressions': 'off',
//         'no-unexpected-multiline': 'off',
//       },
//     },
//   ],
// };
