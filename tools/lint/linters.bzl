load("@aspect_rules_lint//lint:eslint.bzl", "lint_eslint_aspect")
load("@aspect_rules_lint//lint:lint_test.bzl", "lint_test")

eslint = lint_eslint_aspect(
    binary = Label("@//tools/lint:eslint"),
    # ESLint will resolve the configuration file by looking in the working directory first.
    # See https://eslint.org/docs/latest/use/configure/configuration-files#configuration-file-resolution
    # We must also include any other config files we expect eslint to be able to locate, e.g. tsconfigs
    configs = [
        Label("@//:eslintrc"),
        Label("@//:tsconfig"),
        Label("@//tools/test-mocha:eslintrc"),
        Label("@//experimental/service_test_ts_webpack_react_tests:tsconfig"),
        Label("@//experimental/service_test_ts_webpack_react_tests:eslintrc"),
    ],
)
eslint_test = lint_test(aspect = eslint)
