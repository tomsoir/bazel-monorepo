![Build Status](https://github.com/tomsoir/tomsoir-monorepo/actions/workflows/bazel-ci.yml/badge.svg)

# Bazel Multi-Language Monorepo Example

This is a unified mono repo example that demonstrates how to develop, build, test, and deploy full-stack web projects, infrastructure code, and build tools using Bazel. It is designed for scalability, fast builds, and optimized deployment.

## Main Features:
1. [x] Repo package managers:
    - [x] PNPM;
    - [x] PYPI;
1. [x] Programming languages support:
    - [x] TypeScript / JavaScript (Aspect's `rules_ts`);
      - [x] Building:
        - [x] Root package.json [support](https://github.com/tomsoir/tomsoir-monorepo/commit/60eae52e231eb0f6c0312262dccd9798636fefa2) for references across all projects;
        - [x] Build internal packages;
        - [x] Build external packages (PNPM package manager support);
        - [x] [TSC TypeScript transpiler](https://www.typescriptlang.org/) [support](https://github.com/tomsoir/tomsoir-monorepo/blob/main/experimental/service_test_ts/BUILD.bazel#L7-L29);
        - [x] [SWC TypeScript transpiler](https://github.com/aspect-build/rules_swc) [support](https://github.com/tomsoir/tomsoir-monorepo/commit/efaf035d6fb80dbc5a58889eea035e6b00deebf1) (faster TSC alternative);
        - [x] Bundling support:
          - [x] [Webpack](https://webpack.js.org/) support;
          - [x] [ESbuild](https://esbuild.github.io/) [support](https://github.com/tomsoir/tomsoir-monorepo/commit/444a709f6c61455db5dac848f1e144b2caffa152);
          - [x] [RSPack](https://rspack.dev/) [support](https://github.com/tomsoir/tomsoir-monorepo/commit/ba5865b549f9dbb821b27e2d3c116ff98c0ff21b) (Webpack drop in replacement);
          - [x] [Vite](https://vite.dev/) [support](https://github.com/tomsoir/tomsoir-monorepo/commit/66bcb1c95fbd92f189ce4e97315580a17f33e8a3);
        - [x] SCSS-styles support;
          - [x] "use" imports support;
        - [x] Static assets support;
          - [x] Image support example;
          - [x] JSON files support example;
      - [x] Testing:
        - [x] Tests spec files separation from the source code in Bazel (`:tsc` and `:tsc_tests` are separate);
        - [x] Tests coverage;
        - [x] Mocha/Chai support;
        - [x] Vitest support;
      - [x] Developing:
        - [x] Run local dev server (Webpack);
        - [x] Run local dev server (RSpack);
    - [x] Python (Aspect's `rules_py`);
      - [x] Building:
        - [x] Build internal packages;
        - [x] Build external packages (PYPI package manager support);
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
    - [x] Rust;
      - [ ] Building:
        - [ ] Build internal packages;
        - [ ] Build external packages (go_dependency support);
      - [ ] Testing:
        - [ ] Tests support;
        - [ ] Tests coverage;
1. [x] Formatting:
    - [x] Ruff —> Python;
    - [x] Prettier —> JS, TS, HTML, CSS, SCSS, SQL, Markdown;
    - [x] Yamlfmt —> Yaml;
    - [x] Buildifier —> Starlark;
    - [x] Gofumpt —> Go;
    - [x] SHFMT —> shell/bash scripts;
    - [x] Terraform —> Terraform;
1. [x] Linting:
    - [x] Eslint V9 (flat config format) —> JS, JSX, TS, TSX, CJS, MJS. ([commit](https://github.com/tomsoir/tomsoir-monorepo/commit/3efb77f17ce9e584e49616395f797be97f0f71f3));
    - [x] Stylint —> CSS, SCSS ([commit](https://github.com/tomsoir/bazel-monorepo/commit/b2e651068dc6204a061f3cf38b7fc684d69d0b5e));
    - [x] Flake8 —> Py ([commit](https://github.com/tomsoir/bazel-monorepo/commit/160e7b3b85b902e21eb6589a9e733cb888286a8e));
    - [x] Shellcheck —> shell/bash scripts ([commit](https://github.com/tomsoir/bazel-monorepo/commit/8fa05d837dafc371c10e61b36909d966e832d593));
1. [ ] Development:
    - [x] Add Remote Cache Execution [support](https://github.com/tomsoir/tomsoir-monorepo/commit/7dde136d44f72132bbb03c81aa2511de35ec19b9) with [BuildBuddy](https://buildbuddy.io/);
    - [x] Add watcher IBazel to re-build targets on source files change ([instruction](https://github.com/tomsoir/tomsoir-monorepo/commit/9a851378982eb49e1f564928a091e7bb8b7627f3));
    - [x] Add custom Bazel rules examples:
        - [x] Create a file in bazel-bin ([commit](https://github.com/tomsoir/bazel-monorepo/commit/6aa4be60c563ce90c2919ee7db38df209b85496d));
        - [x] Use as dependency in custom rule ([commit](https://github.com/tomsoir/bazel-monorepo/commit/e023f613a194360642d4135fc93a8412905e7591));
        - [x] Use of external (Go-app) binary in custom rule ([commit](https://github.com/tomsoir/bazel-monorepo/commit/354d367e734b5c08cf836334c91a63d8868ddffe));
        - [x] Write back to the source of the project workspace ([commit](https://github.com/tomsoir/bazel-monorepo/commit/04766499fbc61cb8a4eba82b090bce1ad4f8de03));
    - [x] Add custom Bazel repo rules examples:
        - [x] Basic rule installation with file creation in bazel-bin ([commit](https://github.com/tomsoir/bazel-monorepo/commit/16906550c8f12d39d93028692daa2954928365e9))
    - [ ] Auto-generate documentation;
    - [ ] Use Gazelle to auto-update BUILD files;
    - [ ] Custom scripts:
      - [ ] New bazel command to create a new project using a template;
1. [x] CI/CD integration:
    - [x] Renovate bot support to update monorepo dependencies;
    - [x] Add dependencies review for PRs (license, Vulnerabilities, denied, etc...);
    - [x] Use local CI cache to store Bazel artifacts;
    - [x] Build all targets;
    - [x] Run all tests;
    - [x] Run format check;
    - [x] Run lint check;
1. [ ] Infra:
    - [x] Docker: create image;
    - [x] Docker: push image to registry;
    - [x] K8s: generate manifests with concat;
    - [x] K8s: generate manifests with helm;
    - [ ] K8s: manual manifests deploy;
    - [ ] K8s: gitops manifests deploy;
    - [ ] Terraform: run plan;
    - [ ] Terraform: update cloud manifest;

## Main Commands:
### Bazel:
  - `$ bazel build ...` — build all targets in the repo.
  - `$ bazel test ...` — test all (testable) targets in the repo.
    - `$ bazel test --test_output=all ...` - to see tests output in cli.
  - `$ bazel coverage ...` - generate tests coverage.
    - `$ bazel coverage --combined_report=lcov --test_output=all ...` - to see tests output + tests coverage files (in `coverage.dat`).
  - `$ bazel lint ...` - lint all projects.
    - `$ bazel lint ... --fix` - lint fix all projects.
    - `$ bazel lint //experimental/service_test_ts_webpack_react_tests/...` — lint individual project.

### PNPM (for TS/JS):
  - `$ pnpm update` - update all projects in the monorepo.
  - `$ pnpm install` - install all npm deps for all projects in monorepo.
  - `$ pnpm add` — install package in some project (required `$cd` into it, example: `$ pnpm add typescript --save-dev`).
  - `$ pnpm run` — run script in package.json (example `$ pnpm run build`).

### PYPI (for Python):
  #### Manual dependencies update in monorepo (including transitive dependencies).
  - Use `requirements.in` file to manage (install new, update or remove old) Python dependencies in the entire monorepo.
  - `$ bazel run //:pip_generate_requirements_txt` - run to update `requirements.txt` automatically.
  - `$ bazel run //:pip_generate_requirements_txt -- --upgrade` - run to update versions in `requirements.txt` automatically.

### Repo maintenance:
- `$ bazel fetch //...` — fetches all external dependencies required for building all targets in your workspace. Note: It does this without actually building them.
- `$ bazel fetch @npm//...` — update Bazel's copy of pnpm lockfile. Useful after adding new NPM packages.
- `$ bazel mod tidy` — (analog of `bazel sync` in WORKSPACE) sync / check the status of dependencies in MODULES.
- `$ bazel run format` — formats everything in the repo.
  - `$ bazel run //:format` — formats everything in the repo (explicit run from the root).
  - `$ bazel run //:format.check` — check if formatting needs to be applied.
- `$ bazel lint ...` — lints all projects.
    - `$ bazel lint //experimental/service_test_ts_webpack_react_tests/...` — lints individual project.

## Secrets:
- `BUILD_BUDDY_API_KEY` - auth account key for BuildBuddy remote execution UI.
    - For CI use, it's stored in: `repo > settings > secrets > actions > BUILD_BUDDY_API_KEY` key.
    - Create a free personal account on [BuildBuddy](https://buildbuddy.io/) to get this key.

## Other documents:
- [Intro](./docs/INTRO.MD);
- [Create monorepo - step-by-step guide](./docs/CREATE_MONOREPO.MD);
- [Bazel troubleshooting ](./docs/TROUBLESHOOTING.MD);
- [Bazel training ](./docs/BAZEL_TRAINING.MD);
