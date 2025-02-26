# Bazel Monorepo Example

## Main Features:
1. [x] Repo package managers:
    - [x] PNPM;
    - [x] PYPI;
1. [x] Programming languages support:
    - [x] TypeScript / JavaScript (Aspect's `rules_ts`);
      - [x] Building:
        - [x] TSC TypeScript compilation support;
        - [x] Build internal packages;
        - [x] Build external packages (PNPM package manager);
        - [x] Create bundle (Webpack);
        - [x] SCSS-styles support;
        - [ ] SWC TypeScript compilation support;
      - [x] Developing:
        - [x] Run local server (Webpack dev server);
      - [x] Testing:
        - [x] Tests support (Mocha/Chai);
        - [x] Tests spec files separation from the source code (`:tsc` and `:tsc_tests` are separate);
        - [ ] Tests coverage;
    - [x] Python (Aspect's `rules_py`);
      - [x] Building:
        - [x] Build internal packages;
        - [x] Build external packages (PYPI-package manager support);
      - [x] Testing:
        - [x] Tests support;
        - [ ] Tests coverage;
    - [x] GoLang;
      - [ ] Building:
        - [x] Build internal packages;
        - [ ] Build external packages (go_dependency support);
      - [ ] Testing:
        - [ ] Tests support;
        - [ ] Tests coverage;
1. [x] Formatting:
    - [x] Ruff —> Python;
    - [x] Prettier —> JS, TS, HTML, CSS, SCSS, SLQ, Markdown;
    - [x] Yamlfmt —> Yaml;
    - [x] Buildifier —> Starlark;
    - [x] Gofumpt —> Go
    - [x] SHFMT -> shell/bash scripts
    - [x] terraform -> terraform

1. [ ] Local development:
    - [ ] Gazelle to auto update BUILD files;
    - [ ] Use IBazel to watch files;
    - [ ] Remote Cache Execution;
    - [ ] Create new Bazel projects (monorepo bazel rule);
1. [x] CI/CD integration
    - [x] Renovate bot support (to update dependencies);
    - [x] Run format check;
    - [x] Run builds;
    - [x] Run tests;
    - [ ] Push artifacts to push to registry;
1. [ ] Infra
    - [ ] Docker: create image;
    - [ ] Docker: push image to registry;
    - [ ] K8s: generate manifests;
    - [ ] K8s: deploy manifests;
    - [ ] Terraform: run plan;
    - [ ] Terraform: update cloud manifest;

## Main Commands:
### Bazel:
  - `$ bazel build //...` — build all targets in the repo
  - `$ bazel test //...` — test all (testable) targets in the repo
  - `$ bazel run //:format` — formats everything in the repo
  - `$ bazel run //:format.check` — check if formatting need to be applied

### PNPM (for TS/JS):
  - `$ pnpm update` - update all projects in monorepo
  - `$ pnpm install` - install all npm deps for all projects in monorepo
  - `$ pnpm add` — install package in some project (required `$cd` into it, example: `$ pnpm add typescript --save-dev`)
  - `$ pnpm run` — run scripts in package.json (example `$ pnpm run build`)

### PYPI (for Python):
  #### Manual dependencies update in monorepo (including transitive dependencies)
  - Use `requirements.in` file to manage (install new, update or remove old) python dependencies in the entire monorepo
  - `$ bazel run //:generate_requirements_txt` - run to update `requirements.txt` automatically

### Repo maintenance
- `$ bazel mod tidy` - (analog of `bazel sync` in WORKSPACE) sync / check the status of dependencies in MODULES

## Other documents:
- [Create monorepo - step-by-step guide](./docs/CREATE_MONOREPO.MD);
- [Bazel troubleshooting ](./docs/TROUBLESHOOTING.MD);
