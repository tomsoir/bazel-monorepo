Example how to use internal imports like JSON files to run your app.

## Commands

Bazel commands for local dev
```sh
$ bazel clean

$ bazel run :my_app --sandbox_debug
```

## Features

- Bundles node_modules and custom js script into the runnable binary
