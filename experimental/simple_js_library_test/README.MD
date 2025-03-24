## Commands

Bazel commands for local dev
```sh
$ bazel clean

$ bazel build :simple_js_library_test
$ bazel run :simple-js-library-test --sandbox_debug
```

## Features

- Bundles node_modules and custom js script into the runnable binary
