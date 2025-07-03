## Commands

```sh
$ bazel clean
$ bazel build :tsc
$ bazel run :tsc_app

# Push image to docker hub registry
# Note: make sure you logged in to docker: `$ docker login`
$ bazel run //experimental/service_test_ts_infra/infra:push_image
```

## Features

- Support TS-files
- Support imports form other TS-files
  - [important!] .js prefix is required
- Support NPM dependencies
- Transpile TS to JS output files
- Run JS output files
