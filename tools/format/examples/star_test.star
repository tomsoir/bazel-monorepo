load("@bazel_skylib//rules:common_settings.bzl", "string_flag")

my_rule = string_flag(
    name = "my_flag",
    build_setting_default = "",
)
