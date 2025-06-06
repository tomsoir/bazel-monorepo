module.exports = exports = {
  root: true,
  extends: '../../.eslintrc.cjs',
  rules: {
    // 'no-undef': ['off']
    // "indent": ['off'],
    // "comma-dangle": ['off'],
    // "@typescript-eslint/no-require-imports": ['off'],
  },
};

// -------------------------------------------------------
// -------------------------------------------------------
// -------------------------------------------------------

// // $ ESLINT_USE_FLAT_CONFIG=false npx eslint --config experimental/service_test_ts_webpack_react_tests/.eslintrc.cjs --ext .ts,.tsx,.cjs experimental/service_test_ts_webpack_react_tests
// // $ ESLINT_USE_FLAT_CONFIG=false npx eslint --ext .ts,.tsx,.cjs experimental
// // $ bazel run //tools/lint:eslint -- --resolve-plugins-relative-to . --ext .ts,.tsx,.cjs ./experimental
// // $ bazel run //tools/lint:eslint --  --ext .ts,.tsx,.cjs ./experimental

// -------------------------------------------------------
// -------------------------------------------------------
// -------------------------------------------------------

// /* eslint-env node */
// // module.exports = {
// //   extends: ["eslint:recommended", "plugin:@typescript-eslint/recommended"],
// //   parser: "@typescript-eslint/parser",
// //   plugins: ["@typescript-eslint/eslint-plugin"],
// //   root: true,
// //   rules: {
// //     'no-unused-vars': 'warn', // Example: Warning for unused variables
// //     'no-console': 'warn', // Example: Warning for console statements
// //     '@typescript-eslint/no-unsafe-call': 'off',
// //     '@typescript-eslint/no-unsafe-assignment': 'off',
// //     '@typescript-eslint/no-unused-expressions': 'off',
// //     "@typescript-eslint/no-unsafe-assignment": 'off',
// //   }
// // };

// // module.exports = {
// //   extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended'],
// //   parser: '@typescript-eslint/parser',
// //   plugins: ['@typescript-eslint/eslint-plugin'],
// //   root: true,
// //   files: ['**/*.ts', '**/*.tsx'],
// //   rules: {
// //     '@typescript-eslint/no-unsafe-call': 'off',
// //     '@typescript-eslint/no-unsafe-assignment': 'off',
// //     '@typescript-eslint/no-unused-expressions': 'off',
// //   },
// // };

// module.exports = {
//   // extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended'],
//   // parser: '@typescript-eslint/parser',
//   // plugins: ['@typescript-eslint/eslint-plugin'],
//   // root: true,
//   // overrides: [
//   //   {
//   //     root: true,
//   //     files: ['**/*.ts', '**/*.tsx'],
//   //     rules: {
//   //       '@typescript-eslint/no-unsafe-call': 'off',
//   //       '@typescript-eslint/no-unsafe-assignment': 'off',
//   //       '@typescript-eslint/no-unused-expressions': 'off',
//   //       // '@typescript-eslint/no-explicit-any': 'off',
//   //       // '@typescript-eslint/no-unused-vars': ['error', { argsIgnorePattern: '^_' }],
//   //     },
//   //   },
//   // ],

//   overrides: [
//     {
//       root: true,
//       files: ['**/*.ts', '**/*.tsx'],
//       rules: {
//         'no-undef': 'error',

//         // '@typescript-eslint/no-unsafe-call': 'off',
//         // '@typescript-eslint/no-unsafe-assignment': 'off',
//         // '@typescript-eslint/no-unused-expressions': 'off',
//         // // '@typescript-eslint/no-explicit-any': 'off',
//         // // '@typescript-eslint/no-unused-vars': ['error', { argsIgnorePattern: '^_' }],
//       },
//     },
//   ],
// };

// // /* eslint-env node */
// // module.exports = {
// //   // extends: ["eslint:recommended", "plugin:@typescript-eslint/recommended"],
// //   // parser: "@typescript-eslint/parser",
// //   // plugins: ["@typescript-eslint/eslint-plugin"],
// //   root: true,
// //   rules: {
// //     // 'no-unused-vars': 'warn', // Example: Warning for unused variables
// //     // 'no-console': 'warn', // Example: Warning for console statements
// //     // '@typescript-eslint/no-unsafe-call': 'off',
// //     // '@typescript-eslint/no-unsafe-assignment': 'off',
// //     // '@typescript-eslint/no-unused-expressions': 'off',
// //     // "@typescript-eslint/no-unsafe-assignment": 'off',
// //   }
// // };

// // -----

// // // const base = require("../../.eslintrc.cjs")
// // const base = require("../../eslint.config.mjs")

// // base["rules"] = {
// //   'no-unused-vars': 'warn', // Example: Warning for unused variables
// //   'no-console': 'warn', // Example: Warning for console statements
// //   '@typescript-eslint/no-unsafe-call': 'off',
// //   '@typescript-eslint/no-unsafe-assignment': 'off',
// //   '@typescript-eslint/no-unused-expressions': 'off',
// //   "@typescript-eslint/no-unsafe-assignment": 'off',
// // };

// // module.exports = base;

// // -----

// // // monorepo/.eslintrc.js
// // module.exports = {
// //   root: true, // Tells ESLint to stop looking for configs beyond this file.
// //   rules: {
// //     'no-unused-vars': 'warn', // Example: Warning for unused variables
// //     'no-console': 'warn', // Example: Warning for console statements
// //     '@typescript-eslint/no-unsafe-call': 'off',
// //     '@typescript-eslint/no-unsafe-assignment': 'off',
// //     '@typescript-eslint/no-unused-expressions': 'off',
// //   },
// // };
