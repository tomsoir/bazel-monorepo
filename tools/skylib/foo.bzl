# Tutorial: https://bazel.build/rules/rules-tutorial

def _foo_bin_imp(ctx):
    print(">>> (1.1) IMP ctx.label", ctx.label)
    print(">>> (1.1) IMP ctx.label.name", ctx.label.name)

    # ---------------
    # Create a file rule:
    # ---------------
    # 1. Declare this file
    #   - We will use `ctx.label.name` the name that was assigned when
    #     target has been declared in the BUILD file (e.g. "hello_bin1")
    # 2. Tell bazel how to generate this file (by creating the action)
    #   - This will not create file yet, but will teach bazel how to generate
    #     file. But bazel wont create file until it is actually requested
    # 3. Tell bazel that the file is rule's output and not an tempo file used
    #    as within the rule implementation. It means the rule's imp function
    #    is now must return something (not pass).

    # 1.
    out_file = ctx.actions.declare_file(ctx.label.name)

    #  >>> (1.1) IMP out_file <generated file experimental/random/hello_bin2>
    print(">>> (1.1) IMP out_file", out_file)

    # >>> (1.1) IMP out_file basename hello_bin2
    print(">>> (1.1) IMP out_file basename", out_file.basename)

    # >>> (1.1) IMP out_file path bazel-out/darwin_x86_64-fastbuild/bin/experimental/random/hello_bin2
    print(">>> (1.1) IMP out_file path", out_file.path)

    # 2.
    ctx.actions.write(
        output = out_file,
        content = "HELLO {}!\n".format(ctx.attr.username),
    )

    # pass

    # 3.
    # - Run: bazel build //experimental/random:hello_bin1
    #   This will create a new file "hello_bin1" with "HELLO" word
    #   in //bazel-bin/experimental/random/hello_bin1
    #   (if you are in the /experimental/random, run this to read the
    #   file `$ cat ../../bazel-bin/experimental/random/hello_bin1`)
    # - Note: DefaultInfo —> is the way to choose the outputs of the rule
    return [DefaultInfo(files = depset([out_file]))]

foo_binary = rule(
    implementation = _foo_bin_imp,
    attrs = {
        "username": attr.string(),
        "src": attr.label_list(allow_files = False),
    },
)

print(">>> (1.2) BZL foo file is evaluated")
