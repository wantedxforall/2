module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: ['eslint:recommended', 'plugin:security/recommended-legacy'],
  plugins: ['security'],
  parserOptions: {
    ecmaVersion: 12,
    sourceType: 'module',
  },
};