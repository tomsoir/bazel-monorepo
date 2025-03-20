"""
Defines a macro for converting a tsconfig file to a swcrc file.
"""

load("@aspect_rules_js//js:defs.bzl", _js_run_binary = "js_run_binary")
load("@npm//tools/swc:tsconfig-to-swcconfig/package_json.bzl", tsconfig_to_swcconfig = "bin")

def js_run_binary(name, **kwargs):
    """ The standard `js_run_binary` from `@aspect_rules_js//js:defs.bzl` with standard Adobe configuration and features.

    Args:
      name: The name of the target.
      **kwargs: Additional keyword arguments. See [js_run_binary](https://github.com/aspect-build/rules_js/blob/main/docs/js_run_binary.md).
    """
    _js_run_binary(
        name = name,
        # https://github.com/aspect-build/rules_js/blob/main/docs/js_info_files.md#js_info_files-include_npm_sources
        include_npm_sources = kwargs.pop("include_npm_sources", False),
        # https://github.com/aspect-build/rules_js/blob/main/docs/js_info_files.md#js_info_files-include_transitive_sources
        include_transitive_sources = kwargs.pop("include_transitive_sources", False),
        **kwargs
    )

def tsconfig_to_swcrc(name, tsconfig, swcrc_out, **kwargs):
    """Generate a `swcrc` file from a `tsconfig` file.

    Args:
        name: The name of the target.
        tsconfig: The tsconfig file to convert.
        swcrc_out: The output swcrc file.
        **kwargs: Additional keyword arguments. See [js_run_binary](https://github.com/aspect-build/rules_js/blob/main/docs/js_run_binary.md#js_run_binary).
    """
    tsconfig_to_swcconfig.t2s_binary(
        name = "{}_bin".format(name),
        # Always propagate the testonly attribute
        testonly = kwargs.get("testonly", False),
        visibility = ["//visibility:private"],
        **kwargs
    )

    js_run_binary(
        name = name,
        srcs = [tsconfig],
        args = [
            # The alternative to tslib, this flag needs @swc/helpers to be a dependency
            "--set",
            "jsc.externalHelpers=true",
            # As per documentation, useDefineForClassFields is true by default
            # if target is ES2022 or higher, including ESNext, false otherwise
            # https://www.typescriptlang.org/tsconfig/#useDefineForClassFields
            # Swc authors have directed users to be specific about this flag, especially
            # when using decorators, as it can lead to runtime errors
            # https://github.com/swc-project/swc/pull/7055
            "--set",
            "jsc.transform.useDefineForClassFields=false",
            "--set",
            "module.resolveFully=true",
            # TBD
            # "--set",
            # "minify=true",
            "--set",
            '$$schema="https://swc.rs/schema.json"',
            "--filename",
            "$(location {})".format(tsconfig),
        ],
        mnemonic = "TsconfigToSwcrc",
        stdout = swcrc_out,
        include_npm_sources = True,
        include_transitive_sources = True,
        tool = ":{}_bin".format(name),
        **kwargs
    )
