# load("@bazel_skylib//lib:partial.bzl", "partial")
# load("@aspect_rules_swc//swc:defs.bzl", _swc = "swc")
load("@aspect_rules_ts//ts:defs.bzl", _ts_config = "ts_config", _ts_project = "ts_project")

def ts_project(
        name,
        srcs,
        deps = [],
        declaration = True,
        **kwargs):
    tsconfig = kwargs.pop("tsconfig", "tsconfig.json")
    source_map = kwargs.pop("source_map", True)
    out_dir = kwargs.pop("out_dir", "dist")
    root_dir = kwargs.pop("root_dir", "src")
    validate = kwargs.pop("validate", False)
    incremental = kwargs.pop("incremental", False)
    declaration_map = kwargs.pop("declaration_map", False)
    resolve_json_module = kwargs.pop("resolve_json_module", True)
    allow_js = kwargs.pop("allow_js", True)

    # transpiler = partial.make(
    #     _swc,
    #     out_dir = out_dir,
    #     root_dir = root_dir,
    #     swcrc = ":%s_write_swcrc" % name,
    #     source_maps = source_map,
    # )
    # transpiler = kwargs.pop("transpiler", transpiler)

    # if transpiler != "tsc":
    #     if ":node_modules/@swc/helpers" not in deps:
    #         deps = deps + [":node_modules/@swc/helpers"]

    _ts_project(
        name,
        srcs = srcs,
        tsconfig = tsconfig,
        out_dir = out_dir,
        root_dir = root_dir,
        validate = validate,
        source_map = source_map,
        # transpiler = transpiler,
        resolve_json_module = resolve_json_module,
        declaration = declaration,
        declaration_map = False,
        incremental = incremental,
        deps = deps,
        allow_js = allow_js,
        **kwargs
    )
