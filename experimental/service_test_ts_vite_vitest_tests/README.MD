Example of using RSpack to bundle an app and run it locally using the rspack dev server.

## Commands

Bazel commands for local dev
```sh
$ bazel clean

# Just run test
$ bazel test :vitest

# Run with extra info:
# ==== VITEST SETUP: File list ====
# ...
# ==== END FILE LIST ====
#  ✓ src/basic.spec.tsx (1 test) 35ms
#  Test Files  1 passed (1)
#       Tests  1 passed (1)
#    Start at  21:50:35
#    Duration  1.38s (transform 65ms, setup 187ms, import 298ms, tests 35ms, environment 639ms)
$ bazel test :vitest --test_output=all

# Run test coverage (prints summary at end of test output + writes LCOV)
# Example:
# % Coverage report from v8
# ---------------|---------|----------|---------|---------|-------------------
# File           | % Stmts | % Branch | % Funcs | % Lines | Uncovered Line #s
# ---------------|---------|----------|---------|---------|-------------------
# All files      |      40 |      100 |   33.33 |      50 |
#  App.tsx       |      50 |      100 |   33.33 |   66.66 | 20
#  main.tsx      |       0 |      100 |     100 |       0 | 6
#  vite-env.d.ts |       0 |        0 |       0 |       0 |
# ---------------|---------|----------|---------|---------|-------------------
# ================================================================================

$ bazel coverage :vitest --test_output=all
$ bazel coverage :vitest --test_output=all --combined_report=lcov

# View merged LCOV report path after run:
# -> bazel-out/_coverage/_coverage_report.dat
$ bazel info output_path

# Run all tests
$ bazel test ... --sandbox_debug
```

## Features

- Support Vitest testing
- Support Vitest testing coverage
