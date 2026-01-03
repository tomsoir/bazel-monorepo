## Commands

```sh
$ bazel run test_app
$ bazel run test_app_with_deps
$ bazel run test_app_with_deps_server
```

### service_test_py (current)

- Run Py files
- Support PIP deps reference (from the root `requirements.in` file only —> by design)
- Support running Flask server (long running process)

## Dependency update
- Simply update the `requirements.in` file in the root folder with the new dependency
- Run `$ bazel run //:pip_generate_requirements_txt` - run update requirements lock file (`requirements.txt`)
