# Monorepo features:
--
1. Package manager: PNPM
1. Programming languages: TypeScript, Python, GoLang
| Languages specifics   | TypeScript | Python | GoLang |
|-----------------------|------------|--------|--------|
| Package build tool    | Bazel      | Bazel  | Bazel  |
| Basic linting         | ESLint     |        |        |
| Code formatting       | Prettier   |        |        |



# Install Bazel
--
* Install bazelisk (Bazel version manager): `$ brew install bazelisk`
* Check version (version is declared in `.bazelversion` file):
    * `$ bazelisk version`
    * `$ bazel --version`



# Main commands:
--
* Build everything: `$ bazel build //...* `



# Create Monorepo step-by-step guide:
--
## Create monorepo structure
* Create monorepo folders strucuture

## Add BAZEL
* Install Bazelisk (Bazel version manager) to control bazel versions (in `.bazelversion` files): `$ brew install bazelisk`
* Check version (version is declared in `.bazelversion` file):
    * `$ bazelisk version`
    * `$ bazel --version`
* Add MODULES.bazel file to treat monorepo as a single Bazel workspace
* Add root BAZEL.build file and well as create BUILD files

## Add PNPM
* Install PNPM `$ npm i -g pnpm`
* Init monorepo: `$ pnpm init`
* Add node_modules to `.gitignore`
* Add minimum node version: `$ npm pkg set engines.node=">=23.5.0"`
* Add modules types: `$ npm pkg set type="module"`
* Initialize a pnpm Workspace: `$ touch pnpm-workspace.yaml`
* Main commands:
    * `$ pnpm update` - update all projects in monorepo
    * `$ pnpm install` - install all npm deps for all projects in monorepo
    * `$ pnpm add` — install package in some project (required `$cd` into it, example: `$ pnpm add typescript --save-dev`)
    * `$ pnpm run` — run scripts in package.json (example `$ pnpm run build`)

* Convert existing project to PNPN project
    * go to that project and run `$ pnpm init`


## Add Global Prettier
* Install Prettier: `$ pnpm add -D prettier`
    * `$ echo '{\n  "singleQuote": true\n}' > .prettierrc.json`
    * `$ echo -e "coverage\npublic\ndist\npnpm-lock.yaml\npnpm-workspace.yaml" > .prettierignore`
* Add a script for running prettier `$ npm pkg set scripts.format="prettier --write ."`
