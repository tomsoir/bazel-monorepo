load("@aspect_bazel_lib//lib:copy_file.bzl", _copy_file = "copy_file")
load("@aspect_rules_swc//swc:defs.bzl", _swc = "swc")
load("@aspect_rules_ts//ts:defs.bzl", _ts_config = "ts_config", _ts_project = "ts_project")
load("@bazel_skylib//lib:partial.bzl", "partial")
load("//:tools/skylib/tsconfig_to_swcrc.bzl", _tsconfig_to_swcrc = "tsconfig_to_swcrc")

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
    testonly = kwargs.pop("testonly", False)

    ### SWC transpiler declaration begins ###
    transpiler = partial.make(
        _swc,
        out_dir = out_dir,
        root_dir = root_dir,
        swcrc = ":%s_write_swcrc" % name,
        source_maps = source_map,
    )
    transpiler = kwargs.pop("transpiler", transpiler)

    if transpiler != "tsc":
        if ":node_modules/@swc/helpers" not in deps:
            deps = deps + [":node_modules/@swc/helpers"]
    _tsconfig_to_swcrc(
        name = "%s_write_swcrc" % name,
        swcrc_out = ".swcrc_%s" % name,
        tsconfig = "%s_hz_tsconfig" % name if type(tsconfig) == "dict" else tsconfig,
        tags = ["manual"],
    )
    # When tsconfig is a dict, the ts_project macro will define a tsconfig target :_gen_tsconfig_{name}.
    # We define the copy of this file in case webpack_bundle needs to depend on it.
    # IMPORTANT: Do not change `out` file name. The webpack_bundle depends on the actual file name, not the target name.
    _copy_file(
        name = "%s_hz_tsconfig" % name,
        src = ":_gen_tsconfig_%s" % name,
        out = "%s_hz_tsconfig.json" % name,  # Do not change!
        testonly = kwargs.get("testonly", None),
        visibility = kwargs.get("visibility", None),
        tags = ["manual", "testonly"],
    )
    ### SWC transpiler declaration ends ###

    _ts_project(
        name,
        srcs = srcs,
        tsconfig = tsconfig,
        out_dir = out_dir,
        root_dir = root_dir,
        validate = validate,
        source_map = source_map,
        transpiler = transpiler,
        resolve_json_module = resolve_json_module,
        declaration = declaration,
        declaration_map = False,
        incremental = incremental,
        deps = deps,
        allow_js = allow_js,
        # @TODO: disable this to make SWC work for tsc_tests
        testonly = False,
        **kwargs
    )
