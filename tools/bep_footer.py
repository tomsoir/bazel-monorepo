#!/usr/bin/env python3
"""Read a finished Bazel BEP JSON file and print command, exit code, invocation URL."""

import json
import sys

DEFAULT_RESULTS_URL = "https://app.buildbuddy.io/invocation/"


def events(path):
  decoder = json.JSONDecoder()
  with open(path, encoding="utf-8") as fh:
    buf = fh.read()
  i, n = 0, len(buf)
  while i < n:
    while i < n and buf[i].isspace():
      i += 1
    if i >= n:
      break
    obj, end = decoder.raw_decode(buf, i)
    yield obj
    i = end


def _bes_results_url(flag_list):
  prefix = "--bes_results_url="
  for flag in flag_list or []:
    if isinstance(flag, str) and flag.startswith(prefix):
      return flag[len(prefix) :]
  return ""


def main():
  command = ""
  uuid = ""
  name = ""
  code = 0
  results_url = ""
  for event in events(sys.argv[1]):
    started = event.get("started")
    if started:
      command = started.get("command", command)
      uuid = started.get("uuid", uuid)
    finished = event.get("finished")
    if finished:
      exit_code = finished.get("exitCode") or finished.get("exit_code") or {}
      name = exit_code.get("name", name)
      code = exit_code.get("code", code)
    parsed = event.get("optionsParsed") or event.get("options_parsed") or {}
    results_url = (
      _bes_results_url(parsed.get("cmdLine") or parsed.get("cmd_line"))
      or _bes_results_url(
        parsed.get("explicitCmdLine") or parsed.get("explicit_cmd_line")
      )
      or results_url
    )

  invocation = ""
  if uuid:
    base = results_url or DEFAULT_RESULTS_URL
    invocation = base + uuid

  sys.stderr.write(
    "\n==========================================================================\n"
    "> BEP EXPERIMENTAL INTERCEPTOR (https://github.com/tomsoir/bazel-monorepo)\n"
    "==========================================================================\n"
    "command: {} \nexit ({}): code {} \nuuid: {}  \n{}\n"
    "==========================================================================\n".format(
      command, name, code, uuid, invocation
    )
  )
  sys.stderr.flush()


if __name__ == "__main__":
  main()
