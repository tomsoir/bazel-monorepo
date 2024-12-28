## Commands

```sh
$ bazel clean
$ bazel build :tsc
$ bazel build :webpack_build
$ bazel run :webpack_app

$ pnpm run tsc
$ pnpm run webpack
$ pnpm run serve
```

## Features

### service_test_ts

- Support TS-files
- Support imports form other TS-files
  - [important!] .js prefix is required
- Support NPM dependencies
- Transpile TS to JS output files
- Run JS output files

### service_test_ts_webpack (current)

- ~~Support TS file imports without .js extension~~
  - [!important]: when using `type: module`in package.json, file extension must be present
  - `tsc_app` target is replaces by webpack_app because it will fail to run JS files without `.js` extension. Webpack on the other hand knows how to deal with imports without `.js` extensions and will work fine
- Support Webpack bundling
  - webpack works with JS-files transpiled by `:tsc` rule from TS-files —> this is important to know because webpack also can be used to transpile TS files to JS which I don't want intentionally.

### service_test_ts_webpack_react (current)

- Support React + JSX
