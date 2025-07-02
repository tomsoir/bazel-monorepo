# ----------------------------
# Rule: Test foo_binary
#
# Purpose:
#   - Creates {rule_name} file in bazel-bin/experiments/random
#   - File contains username or any other useful info that can be used
#     as reference point to something else.
#   - It teaches how to use bazel ctx.actions, labele, create files on bazel analize phase
#
# BUILD declaration example:
#   ```
#   load("//:tools/skylib/test_rules.bzl", "foo_binary")
#   foo_binary(
#       name = "hello_bin2",
#       username = "Tkachenko",
#   )
#   ```
#
# Output:
#   - New filename: "hello_bin2"
#   - Created in: bazel-bin/experiments/random/
#   - Content: "HELLO Tkachenko!"
#
# Bazel Tutorial: https://bazel.build/rules/rules-tutorial
# ----------------------------

def _foo_bin_imp(ctx):
    print(">>> (1.1) IMP FOO ctx.label", ctx.label)
    print(">>> (1.1) IMP FOO ctx.label.name", ctx.label.name)

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
    print(">>> (1.1) IMP FOO out_file", out_file)

    # >>> (1.1) IMP out_file basename hello_bin2
    print(">>> (1.1) IMP FOO out_file basename", out_file.basename)

    # >>> (1.1) IMP out_file path bazel-out/darwin_x86_64-fastbuild/bin/experimental/random/hello_bin2
    print(">>> (1.1) IMP FOO out_file path", out_file.path)

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

# ----------------------------
# Rule: Test bar_binary
#
# Purpose:
#   - Creates {rule_name} file in bazel-bin/experiments/random
#   - File contains username or any other useful info that can be used
#     as reference point to something else.
#   - It teaches how to use other bazel rules to work with it's output
#
# BUILD declaration example:
#   ```
#   load("//:tools/skylib/test_rules.bzl", "foo_binary")
#   foo_binary(
#       name = "hello_bin2",
#       username = "Tkachenko",
#   )
#    bar_binary(
#        name = "hello_bar_bin1",
#        username = "Artem",
#        src = [":hello_bin2"],
#    )
#   ```
#
# Output:
#   - New filename: "hello_bar_bin1"
#   - Created in: bazel-bin/experiments/random/
#   - Content:
#       "HELLO Artem!"
#       "HELLO Tkachenko!"
# ----------------------------
def _bar_bin_imp(ctx):
    print(">>> (1.1) IMP BAR ctx.label", ctx.label)
    print(">>> (1.1) IMP BAR ctx.label.name", ctx.label.name)

    out_file = ctx.actions.declare_file(ctx.label.name)

    src_files = []
    for dep in ctx.attr.src:
        src_files += dep.files.to_list()

    print(">>> (1.1) IMP BAR src_files", src_files)
    print(">>> (1.1) IMP BAR src_files.path", src_files[0].basename)

    # Build the list of shell commands
    command_lines = []

    # 1. Write your own greeting —> this will add: "HELLO Artem!"
    command_lines.append("echo 'HELLO %s!' > %s" % (ctx.attr.username, out_file.path))

    # 2. Append contents from each dependency file —> this will add: "HELLO Tkachenko!"
    for f in src_files:
        command_lines.append("cat %s >> %s" % (f.path, out_file.path))

    ctx.actions.run_shell(
        inputs = src_files,
        outputs = [out_file],
        command = " && ".join(command_lines),
    )

    print(">>> (1.1) IMP BAR OUT FILE path: `$ cat %s`" % out_file.path)

    # pass
    return [DefaultInfo(files = depset([out_file]))]

bar_binary = rule(
    implementation = _bar_bin_imp,
    attrs = {
        "username": attr.string(),
        "src": attr.label_list(allow_files = False),
    },
)
