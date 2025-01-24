## Commands

```sh
$ bazel test //experimental/service_test_py_tests:pytest_test --verbose_failures
```

### service_test_py_tests (current)

- Tests support
- Fixture example

## Dependency update
- Simply update the `requirements.in` file in the root folder with the new dependency
- Run `$ bazel run //:generate_requirements_txt` - run update requirements lock file (`requirements.txt`)
