// @ts-check

import eslint from '@eslint/js';
import tseslint from 'typescript-eslint';

// import myAppConfig from './experimental/service_test_ts_webpack_react_tests/eslint.config.js';

export default tseslint.config(
  {
    ignores: [
      '**/package.json', // Ignore all package.json files
      'experimental/service_test_ts_rspack_react_tests_assets_swc/package.json', // Or target specific file
    ],
  },

  eslint.configs.recommended,

  {
    files: ['**/*.ts', '**/*.tsx', '**/*.json'],
    ignores: ['**/*.json'],
    extends: [
      ...tseslint.configs.recommendedTypeChecked,
      ...tseslint.configs.stylisticTypeChecked,
    ],
    languageOptions: {
      parserOptions: {
        // indicates to find the closest tsconfig.json for each source file
        project: true,
      },
    },
  },

  // Demonstrate override for a subdirectory.
  // Note that unlike eslint 8 and earlier, it does not resolve to a configuration file
  // in a parent folder of the files being checked; instead it only looks in the working
  // directory.
  // https://eslint.org/docs/latest/use/configure/migration-guide#glob-based-configs
  {
    files: ['experimental/**'],
    ignores: [
      'experimental/service_test_ts_webpack_react_tests/**',
      'experimental/**/*.json',
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
    rules: {
      'no-undef': 'off',
    },
  },

  // ...myAppConfig,
);
