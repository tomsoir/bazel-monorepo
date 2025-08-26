load("@aspect_rules_lint//lint:eslint.bzl", "lint_eslint_aspect")
load("@aspect_rules_lint//lint:flake8.bzl", "lint_flake8_aspect")
load("@aspect_rules_lint//lint:lint_test.bzl", "lint_test")
load("@aspect_rules_lint//lint:stylelint.bzl", "lint_stylelint_aspect")

# Eslint
eslint = lint_eslint_aspect(
    binary = Label("//tools/lint:eslint"),
    # ESLint will resolve the configuration file by looking in the working directory first.
    # See https://eslint.org/docs/latest/use/configure/configuration-files#configuration-file-resolution
    # We must also include any other config files we expect eslint to be able to locate, e.g. tsconfigs
    configs = [
        # was added here for tests only
        # Label("//:stylelintrc"),
        Label("//:eslintrc"),
        Label("//:eslintrc_tsconfig"),
    ],
)
eslint_test = lint_test(aspect = eslint)

# Stylelint
stylelint = lint_stylelint_aspect(
    binary = Label("//tools/lint:stylelint"),
    config = Label("//:stylelintrc"),
)

# Py lint (Flake 8)
flake8 = lint_flake8_aspect(
    binary = Label("//tools/lint:flake8"),
    config = Label("//:.flake8"),
)
