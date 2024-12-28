# Monorepo features:

1. Package manager: PNPM
1. Build system: Bazel
   - Gazelle for BUILD files auto updates (coming soon)
   - Remote Cache Execution (coming soon)
1. Programming languages: TypeScript, Python (coming soon), GoLang (coming soon)
1. Basic formatting: Prettier for TypeScript
1. Basic linting: ESLint (coming soon)
1. Deployment to K8s: Bazel + GitOps rules (coming soon)

# Monorepo how-to creation steps:

## Create monorepo structure

- Create monorepo folders structure
- Add projects

## Install Bazel

- [Not recommended] Pure Bazel installation
  - Note: NOT Recommended because it is better use Aspect CLI instead, which will provide an extended version of Bazel
  - Install bazelisk (Bazel version manager): `$ brew install bazelisk`
  - Check version (version is declared in `.bazelversion` file):
    - `$ bazelisk version`
    - `$ bazel --version`
- [Recommended] Aspect Bazel installation
  - Note: Aspect-cli has build in Bazelisk and Gazelle and more recommended since provides more features like formatters, plugins for Gazelle, etc...
  - Global aspect-cli installation: https://docs.aspect.build/cli/#installation
    - Install Aspect-cli, global package: `$ brew install aspect-build/aspect/aspect`
    - Check version (version is declared in `.bazelversion` file):
        - `$ bazel --version` (it should look like: `aspect 2024.51.0-9234a1390`)
  - Install latest release to monorepo: https://docs.aspect.build/cli/releases/
    - Create `.bazeliskrc` and add next lines:
      ```bash
      BAZELISK_BASE_URL=https://static.aspect.build/aspect
      USE_BAZEL_VERSION=aspect/2024.51.11
      ```
    - Run: `$ aspect` for the first time to download and install all required deps for aspect-cli.
- Add `MODULES.bazel` file to treat monorepo as a single Bazel workspace
- Add root `BAZEL.build` file and create BUILD files in each project
- Main commands:
  - `$ bazel build //...` - Build everything
  - `$ bazel build //... --sandbox_debug` - in sendbox mode
  - `$ bazel clean` - Clean `bazel-bin/` folder
  - `$ bazel run //<path to package>:<target name>` - Run everything
  - `$ bazel query ...` - List all targets (see dependencies graph)
  - `$ bazel shutdown` - to restart bazel demon

## Install PNPM

- Info:
  - https://dev.to/vinomanick/create-a-monorepo-using-pnpm-workspace-1ebn
- Install PNPM `$ npm i -g pnpm`
- Init monorepo (in root folder): `$ pnpm init`
- Add node_modules to `.gitignore`
- Add minimum node version: `$ npm pkg set engines.node=">=23.5.0"`
- Add modules types: `$ npm pkg set type="module"`
- Initialize a pnpm Workspace: `$ touch pnpm-workspace.yaml`
- Main commands:
  - `$ pnpm update` - update all projects in monorepo
  - `$ pnpm install` - install all npm deps for all projects in monorepo
  - `$ pnpm add` — install package in some project (required `$cd` into it, example: `$ pnpm add typescript --save-dev`)
  - `$ pnpm run` — run scripts in package.json (example `$ pnpm run build`)

## Install Prettier

- Install Prettier: `$ pnpm add -D prettier`
  - `$ echo '{\n  "singleQuote": true\n}' > .prettierrc.json`
  - `$ echo -e "coverage\npublic\ndist\npnpm-lock.yaml\npnpm-workspace.yaml" > .prettierignore`
- Add a script for running prettier `$ npm pkg set scripts.format="prettier --write ."`
- Main commands:
  - `$ pnpm run format`

## Add new / Convert existing package into PNPM + BAZEL

- Create a new project:

  - Go to a project and run `$ pnpm init`
  - Go to root and run `$ pnpm install`

- Convert existing project to PNPN project

  - Go to each project and run `$ pnpm init`
  - Go to root and run `$ pnpm install`

- IMPORTANT! Go to `.bazelignore` and add `<new project>/node_modules`
- IMPORTANT! Update `pnpm-workspace.yaml` if new folder with projects is created on the root level (aka ./experimental)
- IMPORTANT! To refresh npm dependencies this trick works:
  - remove any line from .bazelignore
  - run `$ bazel query ...`
  - add back the line in .bazelignore
  - re-run `$ bazel query ...` again
