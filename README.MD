# Monorepo features:

1. [x] Repo package manager: PNPM
1. [ ] Build system: Aspect-CLI / Bazel
    - [ ] Gazelle for BUILD files auto updates;
    - [ ] Remote Cache Execution;
1. [x] Programming languages support:
    - [x] TypeScript / JavaScript (aspect's `rules_ts`);
      - [x] PNPM package manager
      - [x] Webpack, Webpack dev server
      - [x] SCSS
      - [ ] Tests support
    - [x] Python (aspect's `rules_py`);
      - [x] PIP-package manager support
      - [x] Tests support
    - [ ] GoLang;
1. [ ] Local development:
    - [x] Build and run projects with Bazel;
    - [x] Build and run projects with NPM scripts;
    - [ ] Create new Bazel projects (monorepo bazel rule);
    - [x] Run tests locally with Bazel
1. [x] Formatting:
    - [x] Ruff —> Python;
    - [x] Prettier —> JS, TS, HTML, CSS, SCSS, SLQ, Markdown;
    - [x] Yaml
    - [x] Buildifier —> Starlark
1. [ ] Linting
1. [ ] Infra
    - [ ] Docker: image creation
    - [ ] Docker: image push to registry
    - [ ] K8s: generate manifests
    - [ ] K8s: deploy manifests
    - [ ] Terraform
1. [ ] CI/CD integration
    - [ ] Build run
    - [ ] Test run
    - [ ] Artifacts build
    - [ ] Artifacts push to registry

# Monorepo Commands:
## Code styling:
  - `$ bazel run //:format` — formats everything in the repo
  - `$ bazel run //:format.check` — check if formatting need to be applied

## PNPM (for TS/JS):
  - `$ pnpm update` - update all projects in monorepo
  - `$ pnpm install` - install all npm deps for all projects in monorepo
  - `$ pnpm add` — install package in some project (required `$cd` into it, example: `$ pnpm add typescript --save-dev`)
  - `$ pnpm run` — run scripts in package.json (example `$ pnpm run build`)

## PIP (for Python):
  ### Manual dependencies update in monorepo (including transitive dependencies)
  - Use `requirements.in` file to manage (install new, update or remove old) python dependencies in the entire monorepo
  - `$ bazel run //:generate_requirements_txt` - run to update `requirements.txt` automatically
