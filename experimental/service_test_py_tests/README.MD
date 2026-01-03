## Commands

```sh
# Run tests
$ bazel test //experimental/service_test_py_tests:pytest_test --verbose_failures

# Run test app
$ bazel run test_app
```

### service_test_py_tests (current)

- Tests support
- Fixture example

## Dependency update
- Simply update the `requirements.in` file in the root folder with the new dependency
- Run `$ bazel run //:pip_generate_requirements_txt` - run update requirements lock file (`requirements.txt`)
