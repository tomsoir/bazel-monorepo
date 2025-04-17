Example of using RSpack to bundle an app and run it locally using the rspack dev server.

## Commands

Bazel commands for local dev
```sh
$ bazel clean

$ bazel build :tsc
$ bazel build :styles
$ bazel build :assets
$ bazel build :index_html

$ bazel build rspack_bundle_dev
$ bazel run rspack_bundle_dev.serve

$ bazel test :test
$ bazel test ... --sandbox_debug
```

# Live development with iBazel
```sh
# one time: install ibazel
$ brew install ibazel
# run the app-target. Ibazel will monitor changes in source files and rebuild the target
$ ibazel run //experimental/service_test_ts_rspack_react_tests_assets_swc:rspack_bundle_dev.serve --sandbox_debug
# make changes in any source file —> save changes -> ibazel will reload the target
```

## Features

- Support TS transpilation using SWC transpiler from TS to JS
- Support SCSS
- Support Assets
- Support RSPack bundling
