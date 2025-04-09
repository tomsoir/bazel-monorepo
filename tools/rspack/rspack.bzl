load("@aspect_bazel_lib//lib:directory_path.bzl", "directory_path")
load("@aspect_rules_js//js:defs.bzl", "js_binary", "js_run_devserver")
load("@npm//tools/rspack:@rspack/cli/package_json.bzl", rspack_bin = "bin")

def rspack(name, prod_config, dev_config, srcs, deps, node_modules, dev_server_only_srcs = [], bundle_only_srcs = [], **kwargs):
    if not prod_config and not dev_config:
        fail("At least one of prod_config or dev_config must be provided.")
    if prod_config:
        _rspack_bin(name + "_prod", prod_config, srcs, deps, bundle_only_srcs, **kwargs)
        _rspack_bin(name + "_prod_rsdoctor", prod_config, srcs, deps, bundle_only_srcs, env = {
            "RSDOCTOR": "true",
            "NODE_OPTIONS": "--max-old-space-size=12000",
        }, tags = ["manual"], **kwargs)
    if dev_config:
        _rspack_bin(name + "_dev", dev_config, srcs, deps, bundle_only_srcs, **kwargs)
        _rspack_serve_binary("_{}_rspack_binary".format(name + "_dev.serve"), node_modules, ["source-map-loader", "@rspack/dev-server"])
        js_run_devserver(
            name = name + "_dev.serve",
            tool = "_{}_rspack_binary".format(name + "_dev.serve"),
            args = ["dev", "--config"] + ["/".join([".."] * len(native.package_name().split("/"))) + "/$(rootpath %s)" % dev_config] + ["--outputPath %s" % (name + "_dev.serve")],
            data = [dev_config] + srcs + dev_server_only_srcs + deps,
            chdir = native.package_name(),
            **kwargs
        )

def _rspack_bin(name, config, srcs, deps, extra_srcs, **kwargs):
    rspack_bin.rspack(
        name = name,
        srcs = [config] + srcs + deps + extra_srcs,
        args = ["build", "--config"] + ["/".join([".."] * len(native.package_name().split("/"))) + "/$(rootpath %s)" % config] + ["--outputPath %s" % name],
        chdir = native.package_name(),
        out_dirs = [name],
        **kwargs
    )

def _rspack_serve_binary(name, node_modules, pkgs):
    directory_path(
        name = name + "_entrypoint",
        directory = node_modules + "/@rspack/cli/dir",
        path = "bin/rspack.js",
    )
    js_binary(
        name = name,
        data = [node_modules + "/@rspack"] + [node_modules + "/" + p for p in pkgs],
        entry_point = ":" + name + "_entrypoint",
        visibility = ["//visibility:public"],
    )
