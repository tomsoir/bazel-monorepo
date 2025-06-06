import eslint from '@eslint/js';
import tseslint from 'typescript-eslint';

import someRandomProjectEslintConfig from './experimental/service_test_ts_webpack_react_tests/eslint.config.mjs';

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
      // 'experimental/service_test_ts_webpack_react_tests/**',
      'experimental/**/*.json',
    ],
    rules: {
      '@typescript-eslint/no-redundant-type-constituents': 'error',
      'sort-imports': 'off',
      'no-debugger': 'off',

      // '@typescript-eslint/no-unsafe-call': 'off',
      // '@typescript-eslint/no-unsafe-assignment': 'off',
      // '@typescript-eslint/no-unused-expressions': 'off',
    },
  },

  // Demonstrate an additional override after subdirectory files override.
  {
    files: ['**/*.mjs', '**/*.cjs', '**/*.js'],
    rules: {
      'no-undef': 'off',
    },
  },

  {
    files: ['**/*.ts', '**/*.tsx'],
    rules: {
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
  },

  // Demonstrate/ mimics multi-project (subdirectory) approach from
  // the old ESLINT config format (before 9 ver)
  ...someRandomProjectEslintConfig,
);
