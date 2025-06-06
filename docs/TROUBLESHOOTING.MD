## Update pnpm-lock file in Bazel after adding a new project with NPM dependencies.

- Go to `.bazelignore` and add `<new project>/node_modules`
- Update `pnpm-workspace.yaml` if new folder with projects is created on the root level (aka ./experimental)

- Fix-0 (NOT USED YET. PLEASE TRY!): To refresh npm dependencies this trick works:
  - `$ bazel shutdown`
  - `$ bazel fetch //...`

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

## Deep debug with action query (aquery)

In order to see how the entire action graph looks like and what will happen (e.g.):
```sh
$ cd /experimental/service_test_ts_webpack_react_tests`
$ bazel aquery :tsc_tests`
```

This will tell exactly what target will do (which files will be copied and where)

## Property as a dict in Bazel target argument

Sometimes it is handy to use dict as a property. Here is the example

```py
ts_project(
    name = "tsc_tests",
    testonly = True,
    srcs = glob([
        "src/**/*.spec.ts",
    ]),
    validate = False,
    allow_js = True,
    declaration = True,
    declaration_map = True,
    incremental = True,
    out_dir = "dist",
    root_dir = "src",
    resolve_json_module = True,
    source_map = True,
    # tsconfig = "tsconfig.json",
    tsconfig = {
      "compilerOptions": {
        "strict": True,
        "target": "ESNext",
        "module": "ESNext",
        "incremental": True,
        "sourceMap": True,
        "noUnusedLocals": True,
        "moduleResolution": "node",
        "esModuleInterop": True,
        "importHelpers": True,
        "inlineSources": True,
        "allowSyntheticDefaultImports": True,
        "forceConsistentCasingInFileNames": True,
        "declaration": True,
        "declarationMap": True,
        "useUnknownInCatchVariables": False,
        "isolatedModules": True,
        "noImplicitOverride": True,
        "preserveConstEnums": True,
        "skipLibCheck": True,
        "allowJs": True,
        "emitDeclarationOnly": True,
        "resolveJsonModule": True,
        "strictNullChecks": True,
        "jsx": "react-jsx",
        "outDir": "dist",
        "rootDir": "src",
        # "rootDir": ".",
      },
      "exclude": ["node_modules", "dist"]
    },
    deps = [
        ":node_modules/@types/mocha",
        ":node_modules/@types/chai",
        ":node_modules/mocha",
        ":node_modules/chai",
        ":package_json",
        ":tsc",
    ],
)
```


## Lint debug command

1. Run eslint rule directly to see errors `$ bazel run //tools/lint:eslint -- --resolve-plugins-relative-to . --ext .ts,.tsx,.js,.cjs --config .eslintrc.cjs .`

2. To debug eslint configs:
- rename `.eslint.js` to `.eslint.cjs`
- run this from the root:
```sh
$ ESLINT_USE_FLAT_CONFIG=false ESLINT_DEBUG=true DEBUG=eslint:* npx eslint --config .eslintrc.cjs --ext .ts,.tsx,.js,.json experimental/service_test_ts_webpack_react_tests/
```
