// module.exports = {
//     env: {
//       node: true,
//     },
// };

// export default {
//   "root": true,
//   // "env": {
//   //   "node": true
//   // },
//   "rules": {
//     "@typescript-eslint/no-unsafe-call": "off",
//     "@typescript-eslint/no-unsafe-assignment": "off",
//     "@typescript-eslint/no-unused-expressions": "off",
//   }
// }

export default [
  {
    files: ['**/*.ts', '**/*.tsx'],
    rules: {
      '@typescript-eslint/no-unsafe-call': 'off',
      '@typescript-eslint/no-unsafe-assignment': 'off',
      '@typescript-eslint/no-unused-expressions': 'off',
    },
  },
];
