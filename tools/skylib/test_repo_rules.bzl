# ----------------------------
# Rule: Test my_repo_rule
#
# Purpose:
#   - Print message
#   - Describe installation and usage in deps
#
# General Purpose:
#   If you need to download/unpack something and then compile against it,
#   Bazel needs the files present and a BUILD.bazel available before it
#   can even compute actions. Keep in mind that many upstream projects
#   don't ship Bazel BUILD files at all. A repo rule can: fetch that sources,
#   generate BUILD.bazel there and expose nice targets (cc_library, filegroup, etc.)
#   which can be used later as deps in your current targets.
#
#   Regular rules can’t do that because regular rules are only evaluated
#   after Bazel already has the full target graph.
#
# MODULE declaration example:
#   ```
#     ext = use_extension("//:tools/skylib/test_repo_rules.bzl", "my_ext")
#     ext.repo(
#         name = "my_external_repo",
#         message = "YO This is a message from an external repo!",
#     )
#     use_repo(ext, "my_external_repo")
#   ```
#
# BUILD declaration example:
#   ```
#    genrule(
#         name = "print_hello_by_repo_rule",
#         srcs = ["@my_external_repo//:hello"],
#         outs = ["print_hello_by_repo_rule_out.txt"],
#         cmd = "cat $(location @my_external_repo//:hello) > $@",
#     )
#   ```
#
# Output:
#   - New filename: "print_hello_by_repo_rule_out.txt"
#   - Created in: bazel-monorepo/bazel-bin/experimental/random/print_hello_by_repo_rule_out.txt
#   - Content:
#       "Hello from my custom repo!"
#   - Copied back to source path: experimental/random/hello_bar_bin1_patched_by_go_app
#
# Location:
#   - Use: `$ ls -la "$(bazel info output_base)/external/+my_ext+my_external_repo"` to spot the repo files on disk
#   - Content:
#      - BUILD.bazel
#        ------------------------------------------------------------
#        $ cat "$(bazel info output_base)/external/+my_ext+my_external_repo/BUILD.bazel"
#        ------------------------------------------------------------
#        filegroup(
#            name = "hello",
#            srcs = ["hello.txt"],
#            visibility = ["//visibility:public"],
#        )
#        ------------------------------------------------------------
#      - hello.txt
#        ------------------------------------------------------------
#        $ cat "$(bazel info output_base)/external/+my_ext+my_external_repo/hello.txt"
#        ------------------------------------------------------------
#        Hello from my custom repo!
#        ------------------------------------------------------------
#      - REPO.bazel
#        ------------------------------------------------------------
#        $ cat "$(bazel info output_base)/external/+my_ext+my_external_repo/REPO.bazel"
#        ------------------------------------------------------------
#        << empty >>
#        ------------------------------------------------------------
# ----------------------------

#
# 1. Repo rule itself
#
def _my_repo_impl(repository_ctx):
    repository_ctx.file("hello.txt", "Hello from my custom repo!\n")

    repository_ctx.file(
        "BUILD.bazel",
        """
filegroup(
    name = "hello",
    srcs = ["hello.txt"],
    visibility = ["//visibility:public"],
)
""",
    )

my_repo_rule = repository_rule(
    implementation = _my_repo_impl,
    attrs = {
        "message": attr.string(default = "Hello World"),
    },
)

#
# 2. Repo rule module extension
#
def _my_ext_impl(module_ctx):
    # Iterate over all modules that used this extension
    for mod in module_ctx.modules:
        for t in mod.tags.repo:
            my_repo_rule(
                name = t.name,
                message = t.message,
            )

my_ext = module_extension(
    implementation = _my_ext_impl,
    tag_classes = {
        "repo": tag_class(
            attrs = {
                "name": attr.string(mandatory = True),
                "message": attr.string(default = "Hello from bzlmod"),
            },
        ),
    },
)
