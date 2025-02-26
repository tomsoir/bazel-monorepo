## Commands

```sh
$ bazel run server
$ bazel run //experimental/service_test_go_tests:server
```

## How to init a new Go project:
1. `$ cd <<go project path>>`
1. Add main.go file (at least)
1. Run `$ go mod init <<go project path>>`
1. Run `$ bazel run ...` command

## How to run tests:
1. Run `$ bazel test //experimental/service_test_go_tests/... --sandbox_debug`

### service_test_go_tests (current)

- Run Go files
- Compile internal packages
