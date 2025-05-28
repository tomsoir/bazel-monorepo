// monorepo/.eslintrc.js
module.exports = {
  root: true, // Tells ESLint to stop looking for configs beyond this file.
  rules: {
    'no-unused-vars': 'warn', // Example: Warning for unused variables
    'no-console': 'warn', // Example: Warning for console statements
    '@typescript-eslint/no-unsafe-call': 'off',
    '@typescript-eslint/no-unsafe-assignment': 'off',
    '@typescript-eslint/no-unused-expressions': 'off',
  },
};
