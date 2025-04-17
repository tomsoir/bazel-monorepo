## Commands

Bazel commands for local dev
```sh
$ bazel clean

$ bazel build :tsc
$ bazel build :webpack_build
$ bazel build :styles
$ bazel build :index_html

$ bazel run :serve

$ bazel test :test
$ bazel test ... --sandbox_debug
```

Local development commands for testing purposes only
```sh
$ pnpm install

$ pnpm run clean
$ pnpm run build:tsc
$ pnpm run build:webpack_bundle
$ pnpm run build:styles
$ pnpm run build:index_html
$ pnpm run build
$ pnpm run serve
```

# Live development with iBazel
```sh
# one time: install ibazel
$ brew install ibazel
# run the app-target. Ibazel will monitor changes in source files and rebuild the target
$ ibazel run //experimental/service_test_ts_webpack_react_tests:webpack_build.serve --sandbox_debug
# make changes in any source file —> save changes -> ibazel will reload the target
```

## Features

- Support Mocha tests
