![Build Status](https://github.com/tomsoir/tomsoir-monorepo/actions/workflows/bazel-ci.yml/badge.svg)

# Bazel Monorepo Example

## Main Features:
1. [x] Repo package managers:
    - [x] PNPM;
    - [x] PYPI;
1. [x] Programming languages support:
    - [x] TypeScript / JavaScript (Aspect's `rules_ts`);
      - [x] Building:
        - [x] Build internal packages;
        - [x] Build external packages (PNPM package manager support);
        - [x] [TSC TypeScript transpiler](https://www.typescriptlang.org/) [support](https://github.com/tomsoir/tomsoir-monorepo/blob/main/experimental/service_test_ts/BUILD.bazel#L7-L29);
        - [x] [SWC TypeScript transpiler](https://github.com/aspect-build/rules_swc) [support](https://github.com/tomsoir/tomsoir-monorepo/commit/efaf035d6fb80dbc5a58889eea035e6b00deebf1) (faster TSC alternative);
        - [x] Bundling support:
          - [x] [Webpack](https://webpack.js.org/) support;
          - [x] [ESbuild](https://esbuild.github.io/) [support](https://github.com/tomsoir/tomsoir-monorepo/commit/444a709f6c61455db5dac848f1e144b2caffa152) (faster Webpack alternative);
          - [ ] [RSPack](https://rspack.dev/) support (faster Webpack alternative);
        - [x] SCSS-styles support;
          - [x] "use" imports support;
        - [x] Static assets support;
          - [x] Image support example;
          - [x] JSON files support example;
      - [x] Testing:
        - [x] Tests support (Mocha/Chai);
        - [x] Tests spec files separation from the source code (`:tsc` and `:tsc_tests` are separate);
        - [x] Tests coverage;
      - [x] Developing:
        - [x] Run local server (Webpack dev server);
    - [x] Python (Aspect's `rules_py`);
      - [x] Building:
        - [x] Build internal packages;
        - [x] Build external packages (PYPI-package manager support);
      - [x] Testing:
        - [x] Tests support;
        - [x] Tests coverage;
    - [x] GoLang;
      - [ ] Building:
        - [x] Build internal packages;
        - [ ] Build external packages (go_dependency support);
      - [x] Testing:
        - [x] Tests support;
        - [x] Tests coverage;
1. [x] Formatting:
    - [x] Ruff —> Python;
    - [x] Prettier —> JS, TS, HTML, CSS, SCSS, SLQ, Markdown;
    - [x] Yamlfmt —> Yaml;
    - [x] Buildifier —> Starlark;
    - [x] Gofumpt —> Go
    - [x] SHFMT —> shell/bash scripts
    - [x] terraform —> terraform
1. [ ] Development:
    - [ ] Auto generate documentation
    - [ ] Use Gazelle to auto update BUILD files;
    - [ ] Use IBazel to watch files;
    - [x] Add Remote Cache Execution [support](https://github.com/tomsoir/tomsoir-monorepo/commit/7dde136d44f72132bbb03c81aa2511de35ec19b9) with [BuildBuddy](https://buildbuddy.io/);
    - [ ] Custom scripts:
      - [ ] New bazel command to create a new project using template;
1. [x] CI/CD integration:
    - [x] Renovate bot support to update monorepo dependencies;
    - [x] Add dependencies review for PRs (license, Vulnerabilities, Denied, etc...);
    - [x] Use local CI cache to store Bazel artifacts;
    - [x] Build all targets;
    - [x] Run all tests;
    - [x] Run format check;
    - [ ] Push artifacts to registry;
1. [ ] Infra:
    - [x] Docker: create image;
    - [ ] Docker: push image to registry;
    - [ ] K8s: generate manifests;
    - [ ] K8s: deploy manifests;
    - [ ] Terraform: run plan;
    - [ ] Terraform: update cloud manifest;

## Main Commands:
### Bazel:
  - `$ bazel build ...` — build all targets in the repo.
  - `$ bazel test ...` — test all (testable) targets in the repo.
    - `$ bazel test --test_output=all ...` - to see tests output in cli.
  - `$ bazel coverage ...` - generate tests coverage.
    - `$ bazel coverage --combined_report=lcov --test_output=all ...` - to see tests output + tests coverage files (in `coverage.dat`).

### PNPM (for TS/JS):
  - `$ pnpm update` - update all projects in monorepo.
  - `$ pnpm install` - install all npm deps for all projects in monorepo.
  - `$ pnpm add` — install package in some project (required `$cd` into it, example: `$ pnpm add typescript --save-dev`).
  - `$ pnpm run` — run script in package.json (example `$ pnpm run build`).

### PYPI (for Python):
  #### Manual dependencies update in monorepo (including transitive dependencies).
  - Use `requirements.in` file to manage (install new, update or remove old) python dependencies in the entire monorepo.
  - `$ bazel run //:generate_requirements_txt` - ru¡n to update `requirements.txt` automatically.

### Repo maintenance:
- `$ bazel fetch //...` - fetches all external dependencies required for building all targets in your workspace. Note: It does this without actually building them.
- `$ bazel mod tidy` - (analog of `bazel sync` in WORKSPACE) sync / check the status of dependencies in MODULES.
- `$ bazel run //:format` — formats everything in the repo.
- `$ bazel run //:format.check` — check if formatting needs to be applied.

## Other documents:
- [Create monorepo - step-by-step guide](./docs/CREATE_MONOREPO.MD);
- [Bazel troubleshooting ](./docs/TROUBLESHOOTING.MD);
- [Bazel training ](./docs/BAZEL_TRAINING.MD);

## Repo secrets (repo > settings > secrets > actions):
- `BUILD_BUDDY_API_KEY` - auth account key for BuildBuddy remote execution UI. To get one, simply create a free persons account on [BuildBuddy](https://buildbuddy.io/).
