# Adding an npm package as a Bazel tool (example: SASS)

You can turn almost any npm package with a CLI into a Bazel “tool” that runs in your build. The idea is to put the package in a dedicated folder under `tools/`, wire it into the repo’s npm lockfile, and expose a small Starlark macro that runs the package’s binary. This keeps tooling versioned and hermetic. Below we use the **SASS** compiler as the example; the same pattern works for other CLI tools (e.g. Prettier, ESLint, a custom script).

**1. Create a tool package under `tools/`.** Add a directory for the tool (e.g. `tools/sass/`) with its own `package.json` that depends only on the npm package you need. The repo’s `pnpm-workspace.yaml` should already include `tools/*`, so this package will be part of the workspace and appear in the lockfile after `pnpm install`:

```json
// tools/sass/package.json
{
  "name": "sass",
  "version": "0.0.0",
  "type": "module",
  "devDependencies": {
    "sass": "^1.83.4"
  }
}
```

**2. Add a BUILD file for the tool.** Use it to export the Starlark file that will define your macro and, if needed, make `package.json` available to the build (e.g. with `copy_to_bin`). No need to build the tool itself; Bazel will run it via the npm binary:

```python
# tools/sass/BUILD.bazel
load("@aspect_bazel_lib//lib:copy_to_bin.bzl", "copy_to_bin")

package(default_visibility = ["//:__subpackages__"])

exports_files(["sass.bzl"])

copy_to_bin(
    name = "package_json",
    srcs = ["package.json"],
    visibility = ["//:__subpackages__"],
)
```

**3. Load the package’s binary and wrap it in a macro.** With `aspect_rules_js` and a lockfile that includes your tool package, the `npm` repo exposes a `package_json.bzl` for each package. Load the `bin` from that and call the binary in a macro, passing `args`, `chdir`, and either `outs` (single files) or `out_dirs` (directories). Prefer `outs` when writing a file into a directory that other rules also use (e.g. `dist/`) to avoid output path conflicts:

```python
# tools/sass/sass.bzl
load("@npm//tools/sass:sass/package_json.bzl", sass_bin = "bin")

def sass_binary(name, src, output_name, output_dir = None, srcs = [], **kwargs):
    out_dir = output_dir or name
    out_path = "%s/%s" % (out_dir, output_name)
    sass_bin.sass(
        name = name,
        srcs = srcs,
        args = [src, out_path],
        chdir = native.package_name(),
        outs = [out_path],
        visibility = ["//visibility:public"],
        **kwargs
    )
```

**4. Use the macro from any package.** Load the `.bzl` file and call the macro with inputs and output paths. List all source files (entry + partials) in `srcs` so the action is correctly dependent on them:

```python
# experimental/my_app/BUILD.bazel
load("//tools/sass:sass.bzl", "sass_binary")

sass_binary(
    name = "styles",
    src = "src/styles.scss",
    output_name = "styles.css",
    output_dir = "dist",
    srcs = [
        "src/styles.scss",
        "src/styles/_reset.scss",
        "src/styles/_variables.scss",
    ],
)
```

**5. Run the tool and wire it into the rest of the build.** Build the new target (e.g. `bazel build //experimental/my_app:styles`). Use the target as a dependency of bundles or other rules (e.g. in `srcs` of your rspack/webpack macro) so the generated CSS is included in the app. Add `tools/<tool>/node_modules` to `.bazelignore` so Bazel does not try to sync that directory.

**Summary:** Add a `tools/<name>/` package with `package.json` and a BUILD that exports a `.bzl`; in the `.bzl`, load `@npm//tools/<name>:<package>/package_json.bzl`’s `bin` and call it with the right `args`, `chdir`, and `outs` or `out_dirs`. Then any BUILD file can load your macro and get a versioned, hermetic CLI tool. The same approach works for any npm package that exposes a binary.
