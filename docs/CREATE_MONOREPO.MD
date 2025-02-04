
# Monorepo creation steps:

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

## Add new / Convert existing package into PNPM + BAZEL

- Create a new project:

  - Go to a project and run `$ pnpm init`
  - Go to root and run `$ pnpm install`

- Convert existing project to PNPN project

  - Go to each project and run `$ pnpm init`
  - Go to root and run `$ pnpm install`

- IMPORTANT! Go to `.bazelignore` and add `<new project>/node_modules`
- IMPORTANT! Update `pnpm-workspace.yaml` if new folder with projects is created on the root level (aka ./experimental)
- IMPORTANT!!! Refresh npm dependencies in bazel. [Read details here](./TROUBLESHOOTING.MD);

## Add Python support

  - Info:
    - https://github.com/aspect-build/rules_py/tree/23f0f019df7921927b2677a1d40b40af27e09458/examples/uv_pip_compile
  - Add `requirements.in` and `requirements.txt` if the root of the repo.
    - `requirements.in` - for manual dependencies update
    - `requirements.txt` - this is actually requirements LOCK file and it updates automatically. It contains all meta info related to deps and transitive deps for python.
      - Use: `$ bazel run //:generate_requirements_txt` to update it
  - [Add Python language support — commit](https://github.com/tomsoir/tomsoir-monorepo/commit/1c0efc049f7ae6babb20d16b616b7061b46e5c95)
  - [Add Python tests support - commit](https://github.com/tomsoir/tomsoir-monorepo/commit/aaf9d7b5d0cb7b8212d418710bfff54c5b854209)
