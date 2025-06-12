load("@aspect_rules_lint//lint:eslint.bzl", "lint_eslint_aspect")
load("@aspect_rules_lint//lint:lint_test.bzl", "lint_test")
load("@aspect_rules_lint//lint:stylelint.bzl", "lint_stylelint_aspect")

eslint = lint_eslint_aspect(
    binary = Label("@//tools/lint:eslint"),
    # ESLint will resolve the configuration file by looking in the working directory first.
    # See https://eslint.org/docs/latest/use/configure/configuration-files#configuration-file-resolution
    # We must also include any other config files we expect eslint to be able to locate, e.g. tsconfigs
    configs = [
        Label("@//:eslintrc"),
        Label("@//:eslintrc_tsconfig"),
    ],
)
eslint_test = lint_test(aspect = eslint)

stylelint = lint_stylelint_aspect(
    binary = Label("//tools/lint:stylelint"),
    config = Label("//:stylelintrc"),
)
