## Command:

```sh
utils/build-script --foundation --libdispatch --skip-test-linux --install-foundation --install-libdispatch --skip-test-foundation=1 --skip-build-benchmarks --swiftsyntax --install-swiftsyntax --swiftpm --install-swiftpm --llbuild --install-swift --xctest --install-xctest
```

Not tested, but maybe the `--sccache` can help to speed up compilation.

## Help commands

- The following command helps us to handle the built toolchains path.
  ```bash
  export SWIFT="/home/vrjuliao/swift-project/build/Ninja-DebugAssert/toolchain-linux-x86_64/usr/bin"
  ```