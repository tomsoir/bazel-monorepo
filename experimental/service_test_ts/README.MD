<!-- pnpm install
pnpm start

Visit http://localhost:3000/health to see the "helloworld" response. -->

$ bazel clean
$ bazel build //experimental/service_test_ts:tsc
$ bazel run //experimental/service_test_ts:svc
