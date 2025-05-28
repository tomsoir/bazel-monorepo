load("@npm//:defs.bzl", "npm_link_all_packages")
load("@npm//tools/vite:vite/package_json.bzl", vite_bin = "bin")
load("@npm//tools/vite:vitest/package_json.bzl", vitest_bin = "bin")

BUILD_DEPS = [
    ":node_modules/@vitejs/plugin-react-swc",
    ":node_modules/@testing-library/dom",
    ":node_modules/@testing-library/jest-dom",
    ":node_modules/@testing-library/user-event",
    ":node_modules/@testing-library/react",
    ":node_modules/jsdom",
    ":node_modules/react",
    ":node_modules/react-dom",
    ":node_modules/vitest",
    ":node_modules/vite",
]

def vite(tests = [], assets = [], deps = [], **kwargs):
    # Fix for jsdom dependency which is required as a dynamic import from some
    # sub-dependency, for this reason we have to setup jsdom in to root package.json
    ROOT_NPM_FIX = ["//:node_modules"]

    BUILD_CONFIGS = deps

    vite_bin.vite(
        name = "vite",
        srcs = BUILD_DEPS + assets + deps,
        args = ["build --config vite.config.ts"],
        chdir = native.package_name(),
        out_dirs = ["dist"],
        visibility = ["//visibility:public"],
    )

    vitest_bin.vitest_test(
        name = "vitest",
        # args = [
        #     "run",
        #     "--config=vite.config.ts",
        #     "--include=src/**/*.spec.tsx",
        # ],
        args = ["-c", "find . && npx vitest run --config=vite.config.ts"],
        chdir = native.package_name(),
        data = BUILD_DEPS + assets + deps + tests + ROOT_NPM_FIX,
    )
