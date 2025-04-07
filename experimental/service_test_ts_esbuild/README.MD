[ESbuild](https://esbuild.github.io/) is another fast alternative to Webpack. It's a nice and fast way to bundle multiple JS files in src/ folder (with all their internal and external dependencies such as NPM deps) into a single JS file. Another use case is to create code-split chunks that can be lazy-loaded.

This project contains an example of how to:
- use typescript to transpile ts into js files
- bundle final js files using the esbuild
- and achieve it all using Bazel

## Commands

```sh
$ bazel clean
$ bazel build :bundle
# or
$ bazel run :esbuild_binary_app_bin
```

## Features

- Support TS-files
- Support imports form other TS-files
  - [important!] .js prefix is required
- Support NPM dependencies
- Transpile TS to JS output files
- Bundle transpiled files in a single file using fast `esbuild`
- Run JS output files after the `esbuild`
