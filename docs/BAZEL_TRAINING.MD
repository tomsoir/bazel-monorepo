# Bazel Training
### The list of learning resources, Q&A notes, random links
## Curated Bazel Reading List

# Bazel 101
- [Build Basics](https://bazel.build/basics)
    - [Why a Build System?](https://bazel.build/basics/build-systems)
    - [Task-Based Build Systems](https://bazel.build/basics/task-based-builds)
    - [Artifact-Based Build Systems](https://bazel.build/basics/artifact-based-builds)
    - [Distributed Builds](https://bazel.build/basics/distributed-builds)
    - [Dependency Management](https://bazel.build/basics/dependencies)
    - [Hermeticity](https://bazel.build/basics/hermeticity) 
- [Bazel Vision](https://bazel.build/about/vision)
- [Why Bazel?](https://bazel.build/about/intro)
- [Workspaces, packages, and targets](https://bazel.build/concepts/build-ref)
- [Labels](https://bazel.build/concepts/labels)
- [BUILD files](https://bazel.build/concepts/build-files)
- [Dependencies](https://bazel.build/concepts/dependencies)
- [Visibility](https://bazel.build/concepts/visibility)
- [External Dependencies](https://bazel.build/docs/external)
- [Phases of a build](https://bazel.build/run/build#build-phases) 
- Building with Bazel
    Note: Do not try to read the entire page. Focus on deep linked sections.
    - [Available commands](https://bazel.build/run/build#available-commands)
    - Q.What is in the build? A. Run “bazel query …”
    - [Building one target](https://bazel.build/run/build#bazel-build)
    - [Building multiple targets](https://bazel.build/run/build#specifying-build-targets)
    - [Command line reference](https://bazel.build/reference/command-line-reference) - The list is massive, but is systematic. No need to get familiar with every option, just the way the command line is organized.
- Practice:
    - [Build a Java Project](https://bazel.build/start/java) or [Build a C++ Project](https://bazel.build/start/cpp) 

# Bazel 201 - Custom Rules
- [Starlark Language](https://bazel.build/rules/language)
- [Macros and Rules](https://bazel.build/extending/concepts#macros_and_rules) 
- [Macros Reference](https://bazel.build/extending/macros)
- [Rules Reference](https://bazel.build/extending/rules)
    - Rule creation
    - Target instantiation
    - Attributes
    - Output attributes
    - Targets
    - Files
    - Declaring outputs
    - Actions
    - Providers
    - Runfiles & Runfiles symlinks
    - Executable rules and test rules
- [Depsets](https://bazel.build/extending/depsets)
- [Repository Rules](https://bazel.build/extending/repo)
- [Using Macros to Create Custom Verbs](https://bazel.build/rules/verbs-tutorial)
- [Testing Rules](https://bazel.build/rules/testing)  
- Practice:
    - [Create a rule](https://bazel.build/rules/rules-tutorial) 
    - [Rules examples repository](https://github.com/bazelbuild/examples/tree/main/rules) 

# Bazel 202 - Language-specific rules
- JavaScript
    - [rules_js](https://github.com/aspect-build/rules_js) - pnpm support
    - [rules_ts](https://github.com/aspect-build/rules_ts) - [TypeScript](http://typescriptlang.org/)
    - [rules_swc](https://github.com/aspect-build/rules_swc) - [swc](https://swc.rs/)
    - [rules_esbuild](https://github.com/aspect-build/rules_esbuild) - [esbuild](https://esbuild.github.io/)
    - [rules_webpack](https://github.com/aspect-build/rules_webpack) - [Webpack](https://webpack.js.org/)
    - [rules_webtesting](https://github.com/bazelbuild/rules_webtesting) 
- C++ to WASM: [emsdk](https://github.com/emscripten-core/emsdk/tree/main/bazel) 
- macOS/iOS:
    - [rules_apple](https://github.com/bazelbuild/rules_apple)
    - [rules_ios](https://github.com/bazel-ios/rules_ios)
    - [rules_xcodeproj](https://github.com/buildbuddy-io/rules_xcodeproj) 
- Go: [rules_go](https://github.com/bazelbuild/rules_go) 
- Python: [rules_python](https://github.com/bazelbuild/rules_python) 
- Practice:
    - [Hello World (C++ to WASM/JS)](https://github.com/s0l0ist/bazel-emscripten) 
    - [Next.js Example](https://github.com/aspect-build/bazel-examples/tree/main/next.js) 

# Bazel 203 - Packaging rules
- Tar, Zip, Deb, PRM: [rules_pkg](https://github.com/bazelbuild/rules_pkg)
- Containers: [rules_docker](https://github.com/bazelbuild/rules_docker) 
- Kubernetes & GitOps: [rules_gitops](https://github.com/adobe/rules_gitops) 

# Bazel 302 - In depth topics
- [Correct incremental rebuilds](https://bazel.build/run/build#correct-incremental-rebuilds)
- [The Bazel Query Reference](https://bazel.build/query/language#language-concepts)
- [Action Graph Query (aquery)](https://bazel.build/query/aquery)
- [Fetching external dependencies](https://bazel.build/run/build#fetching-external-dependencies)
- Bazel Caching Explained
    - [How Bazel Works](https://sluongng.hashnode.dev/bazel-caching-explained-pt-1-how-bazel-works)
    - [Bazel In-Memory Cache](https://sluongng.hashnode.dev/bazel-caching-explained-pt-2-bazel-in-memory-cache)
    - [Repository Cache](https://sluongng.hashnode.dev/bazel-caching-explained-pt-3-repository-cache)
    - [Persistent Action Cache](https://sluongng.hashnode.dev/bazel-caching-explained-pt-4-persistent-action-cache) 
- [How does Bazel track local resource usage?](https://jmmv.dev/2019/12/bazel-local-resources.html) 
- [Remote Caching](https://bazel.build/remote/caching)
- [Remote Caching and Remote Execution Explained](https://www.buildbuddy.io/blog/bazels-remote-caching-and-remote-execution-explained/)
- [Debugging Remote Cache Hits](https://bazel.build/remote/cache-remote)
- [Debugging Remote Cache Hits for Local Execution ](https://bazel.build/remote/cache-local) 
- [Test encyclopedia](https://bazel.build/reference/test-encyclopedia)
- [Performance profiling](https://bazel.build/rules/performance#performance-profiling)
- [Memory profiling](https://bazel.build/rules/performance#memory-profiling) 
- [Analyzing Build Performance (blog)](https://blog.bazel.build/2022/11/15/build-performance-metrics.html)  
- [—subcommands command line parameter](https://bazel.build/reference/command-line-reference#flag--subcommands)
- [Output Directory Layout](https://bazel.build/remote/output-directories)

# Bazel 401 - Multi Platform Builds
- [Building with Platforms](https://bazel.build/concepts/platforms)
- [Platforms Reference](https://bazel.build/docs/platforms)
- [Toolchains Reference](https://bazel.build/docs/toolchains)
- [Configurations Reference](https://bazel.build/extending/config)
- [Configurable Attributes Reference](https://docs.bazel.build/versions/master/configurable-attributes.html) 
- [Configurable Query (cquery)](https://bazel.build/query/cquery) 
- Bazel Platforms Cookbook
    - [Hello World - How and when do I use platforms + constraints?](https://github.com/hlopko/bazel_platforms_examples/tree/master/examples/01_hello_world)
    - [Using different platforms](https://github.com/hlopko/bazel_platforms_examples/tree/master/examples/02_using_different_platforms)
    - [How do I specify that some library cannot target e.g. Windows?](https://github.com/hlopko/bazel_platforms_examples/tree/master/examples/03_target_not_compatible_with_constraint)
    - [On a library, I want to say needs java > 1.8, how?](https://github.com/hlopko/bazel_platforms_examples/tree/master/examples/06_integer_constraint) 
    - [How do I match multiple config settings at once?](https://github.com/hlopko/bazel_platforms_examples/tree/master/examples/06_integer_constraint) 
    - [How do I express that haswell cpu also implies SSE3 availability?](https://github.com/hlopko/bazel_platforms_examples/tree/master/examples/06_integer_constraint).
    - [How and when do I use --define?](https://github.com/hlopko/bazel_platforms_examples/tree/master/examples/07_using_define)
    - [How and when should I use build_setting?](https://github.com/hlopko/bazel_platforms_examples/tree/master/examples/08_using_build_setting)

# Bazel 402 - Persistent workers
- [Persistent Workers](https://bazel.build/remote/persistent)
- [What are Bazel's strategies?](https://jmmv.dev/2019/12/bazel-strategies.html) 
- [Creating Persistent Workers](https://bazel.build/remote/creating) 
- [Multiplex Workers](https://bazel.build/remote/multiplex)
