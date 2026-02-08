load("@npm//tools/sass:sass/package_json.bzl", sass_bin = "bin")

def sass_binary(name, src, output_name, output_dir = None, srcs = [], **kwargs):
    """Compiles a Sass entry file to CSS using the npm sass package.

    Args:
        name: Target name.
        src: Main .scss entry file path (e.g. "src/styles.scss"); used as sass CLI input.
        output_name: Output CSS filename (e.g. "styles.css").
        output_dir: Output directory (e.g. "dist"); output will be output_dir/output_name. Defaults to name.
        srcs: All .scss files (entry + partials) as labels so they are inputs to the action.
        **kwargs: Passed to the underlying sass binary rule.
    """
    out_dir = output_dir or name
    out_path = "%s/%s" % (out_dir, output_name)

    # Use outs (single file) instead of out_dirs so we can write to dist/ without
    # conflicting with other rules that output files under dist/ (e.g. dist/index.html).
    sass_bin.sass(
        name = name,
        srcs = srcs,
        args = [src, out_path],
        chdir = native.package_name(),
        outs = [out_path],
        visibility = ["//visibility:public"],
        **kwargs
    )
