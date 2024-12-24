## Commands
```sh
$ bazel clean
$ bazel build :tsc
$ bazel run :tsc_app
```

## Features
### service_test_ts (current)
* Support TS-files
* Support imports form other TS-files
    * [important!] .js prefix is required
* Support NPM dependencies
* Transpile TS to JS output files
* Run JS output files
