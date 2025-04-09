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

## Features

- Support TS transpilation using SWC transpiler from TS to JS
- Support SCSS
- Support Assets
- Support RSPack bundling
