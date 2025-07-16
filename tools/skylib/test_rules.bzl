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
#   - It teaches how to use other bazel targets to work with it's output in this rule
#
# BUILD declaration example:
#   ```
#   load("//:tools/skylib/test_rules.bzl", "foo_binary", "bar_binary)
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

    # 1. Declare output file of this rule. This will be a brand new file and it will contain updated content from src file
    out_file = ctx.actions.declare_file(ctx.label.name)

    # 2. Collect list of files from src label. This label contains dep. target/s
    src_files = []
    for dep in ctx.attr.src:
        src_files += dep.files.to_list()

    print(">>> (1.1) IMP BAR src_files", src_files)
    print(">>> (1.1) IMP BAR src_files.path", src_files[0].basename)

    # 3. Build the list of shell commands
    command_lines = []

    # 3.1 Write a new content —> this will add: "HELLO Artem!"
    command_lines.append("echo 'HELLO %s!' > %s" % (ctx.attr.username, out_file.path))

    # 3.2 Append contents from each dependency file (from dep. targets) —> this will add: "HELLO Tkachenko!"
    for f in src_files:
        command_lines.append("cat %s >> %s" % (f.path, out_file.path))

    # 4. Run shell script to apply shell commands (inside bazel sandbox)
    ctx.actions.run_shell(
        inputs = src_files,
        outputs = [out_file],
        command = " && ".join(command_lines),
    )

    # 5. Return bak rule's output file to be useful for other rules
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

# ----------------------------
# Rule: Test bar_binary
#
# Purpose:
#   - Creates {rule_name}"_patched_by_go_app" file in bazel-bin/experiments/random
#   - Update file content with using go app as an external plugin
#   - It teaches how to add and use any other binary (it can be GO, Python, JS etc..)
#     inside bazel rule declaration
#
# BUILD declaration example:
#   ```
#   load("//:tools/skylib/test_rules.bzl", "foo_binary", "bar_binary", "baz_binary")
#   foo_binary(
#       name = "hello_bin2",
#       username = "Tkachenko",
#   )
#   bar_binary(
#       name = "hello_bar_bin1",
#       username = "Artem",
#       src = [":hello_bin2"],
#   )
#   baz_binary(
#       name = "hello_baz_bin1",
#       src = [":hello_bar_bin1"],
#   )
#   ```
#
# Output:
#   - New filename: "hello_bar_bin1_patched_by_go_app"
#   - Created in: bazel-bin/experiments/random/
#   - Content:
#       "HELLO Artem!"
#       "HELLO Tkachenko!"
#       "HELLO WORKS FROM GO APP!"
# ----------------------------
def _use_go_bin_app_example(ctx, file_to_edit):
    out_file = ctx.actions.declare_file(file_to_edit.basename + "_patched_by_go_app")

    ctx.actions.run(
        executable = ctx.executable._use_go_bin_app,
        arguments = [
            "--file",
            file_to_edit.path,
            "--output",
            out_file.path,
        ],
        inputs = [file_to_edit],
        outputs = [out_file],
        mnemonic = "GoAppend",
        progress_message = "Appending to copy of %s" % file_to_edit.basename,
    )

    return out_file

def _baz_bin_imp(ctx):
    print(">>> (1.1) IMP BAZ ctx.label", ctx.label)
    print(">>> (1.1) IMP BAZ ctx.label.name", ctx.label.name)

    # 1. Get file from src (assuming 1 target, 1 file)
    src_files = []
    for dep in ctx.attr.src:
        src_files += dep.files.to_list()
    print(">>> (1.1) IMP BAZ src_files", src_files)

    if not src_files:
        fail("Expected at least one src file")

    # 2. Collect all output files after appending using Go app.
    updated_files = []
    for f in src_files:
        updated = _use_go_bin_app_example(ctx, f)
        updated_files.append(updated)
    print(">>> (1.1) IMP BAZ updated_files", updated_files)

    return [DefaultInfo(files = depset(updated_files))]

baz_binary = rule(
    implementation = _baz_bin_imp,
    attrs = {
        # "username": attr.string(),
        "src": attr.label_list(allow_files = False),
        "_use_go_bin_app": attr.label(
            default = Label("//experimental/simple_go_bin:simple_go_bin_app"),
            cfg = "exec",
            executable = True,
            allow_files = True,
        ),
    },
)

# ----------------------------
# Rule: Test qux_binary
#
# Purpose:
#   - Writes generated file back to source
#   - It teaches how to return file to source tree after it has been generated buy bazel
#       - NOTE: (https://dev.to/bazel/bazel-can-write-to-the-source-folder-b9b)
#         "If you restrict yourself to only bazel build and bazel test, then it's true that neither of
#         these commands can mutate the source tree. Bazel is strictly a transform tool from the sources
#         to its own bazel-out folder. However, bazel run has no such limitation, and in fact always sets
#         an environment variable BUILD_WORKSPACE_DIRECTORY which makes it easy to find your sources and
#         modify them."
#
# BUILD declaration example:
#   ```
#   load("//:tools/skylib/test_rules.bzl", "foo_binary", "bar_binary", "baz_binary", "qux_binary")
#   foo_binary(
#       name = "hello_bin2",
#       username = "Tkachenko",
#   )
#   bar_binary(
#       name = "hello_bar_bin1",
#       username = "Artem",
#       src = [":hello_bin2"],
#   )
#   baz_binary(
#       name = "hello_baz_bin1",
#       src = [":hello_bar_bin1"],
#   )
#   qux_binary(
#       name = "hello_qux_bin1",
#       src = [":baz_binary"],
#       write_to_path = "experimental/random"
#   )
#   ```
#
# Output:
#   - New filename: "hello_bar_bin1_patched_by_go_app"
#   - Created in: bazel-bin/experiments/random/
#   - Content:
#       "HELLO Artem!"
#       "HELLO Tkachenko!"
#       "HELLO WORKS FROM GO APP!"
#   - Copied back to source path: experimental/random/hello_bar_bin1_patched_by_go_app
# ----------------------------

def _qux_bin_imp(ctx):
    print(">>> (1.1) IMP QUX ctx.label", ctx.label)
    print(">>> (1.1) IMP QUX ctx.label.name", ctx.label.name)

    # 1. Get file from src (assuming 1 target, 1 file)
    src_files = []
    for dep in ctx.attr.src:
        src_files += dep.files.to_list()
    print(">>> (1.1) IMP QUX src_files", src_files)
    if not src_files:
        fail("Expected at least one src file")

    # 2. Write shell script to copy files back to the source tree
    command_lines = [
        "#!/usr/bin/env bash",
        'echo "HELLO YOOO ———> $BUILD_WORKSPACE_DIRECTORY"',
    ]
    for f in src_files:
        # Use $BUILD_WORKSPACE_DIRECTORY to make the path absolute
        src_path = "$BUILD_WORKSPACE_DIRECTORY/" + f.path
        dest_path = "$BUILD_WORKSPACE_DIRECTORY/%s%s" % (ctx.attr.write_to_source_path, f.basename)
        command_lines.append('echo "--> copy me %s to %s"' % (src_path, dest_path))
        command_lines.append('echo "--> cp %s %s"' % (src_path, dest_path))
        command_lines.append("ls -la %s" % src_path)
        command_lines.append("cp -fv %s %s" % (src_path, dest_path))
    print(">>> (1.1) IMP QUX command_lines", "\n".join(command_lines))

    # 3. Create a new output file (shell script) and run it or exit from the rule (automatically).
    out_file = ctx.actions.declare_file(ctx.label.name + ".sh")
    ctx.actions.write(
        output = out_file,
        content = "\n".join(command_lines),
        is_executable = True,
    )
    print(">>> (1.1) IMP QUX OUT FILE path1: `$ cat %s`" % out_file.path)

    return [
        DefaultInfo(
            files = depset([out_file]),
            executable = out_file,
            runfiles = ctx.runfiles(files = src_files),
        ),
    ]

qux_binary = rule(
    implementation = _qux_bin_imp,
    attrs = {
        "src": attr.label_list(allow_files = False),
        "write_to_source_path": attr.string(),
    },
    executable = True,
)
