## Commands

```sh
$ bazel clean
$ bazel build :tsc
$ bazel bunld :webpack_build
$ bazel run :webpack_app
```

# Live development with iBazel
```sh
# one time: install ibazel
$ brew install ibazel
# run the app-target. Ibazel will monitor changes in source files and rebuild the target
$ ibazel run experimental/service_test_ts_webpack:webpack_app
# make changes in any source file —> save changes -> ibazel will reload the target
```

## Features

- ~~Support TS file imports without .js extension~~
  - [!important]: when using `type: module`in package.json, file extension must be present
  - `tsc_app` target is replaces by webpack_app because it will fail to run JS files without `.js` extension. Webpack on the other hand knows how to deal with imports without `.js` extensions and will work fine
- Support Webpack bundling
  - Webpack works with JS-files transpiled by `:tsc` rule from TS-files —> this is important to know because webpack also can be used to transpile TS files to JS which I don't want intentionally.
