## Update pnpm-lock file in Bazel after adding a new project with NPM dependencies.

- Go to `.bazelignore` and add `<new project>/node_modules`
- Update `pnpm-workspace.yaml` if new folder with projects is created on the root level (aka ./experimental)

- Fix-1: To refresh npm dependencies this trick works:
  - remove any line from `.bazelignore`
  - run `$ bazel query ...`
  - add back the line in `.bazelignore`
  - re-run `$ bazel query ...` again

- Fix-2: To refresh npm dependencies this trick works (extra hardcoded option):
  - `$ cd` to that package (e.g.: `cd tools/test-mocha`)
  - `$ pnpm install`
  - `$ pnpm update`
  - continue from monorepo root folder (`$ cd ../../`)
  - remove any line from `.bazelignore`
  - run `$ bazel query ...`
  - add back the line in `.bazelignore`
  - re-run `$ bazel query ...` again
