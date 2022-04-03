## Command:

```sh
utils/build-script --foundation --libdispatch --skip-test-linux --install-foundation --install-libdispatch --skip-test-foundation=1 --skip-build-benchmarks --swiftsyntax --install-swiftsyntax --swiftpm --install-swiftpm --llbuild --install-swift --xctest --install-xctest
--release --no-asserts --sccache
```

Not tested, but maybe the `--sccache` can help to speed up compilation.

## Help commands

- The following command helps us to handle the built toolchains path.
  ```bash
  export SWIFT="/home/vrjuliao/swift-project/build/Ninja-DebugAssert/toolchain-linux-x86_64/usr/bin"
  ```

## Build swift syntax parser
```sh
utils/build-tooling-libs --release --no-assertions --build-dir /tmp/tooling-libs-build --install-prefix /home/vrjuliao/swift-project/build/Ninja-DebugAssert/toolchain-linux-x86_64/usr
```

## Compiling Code with swift syntax
```sh
$SWIFT/swiftc \
-L /home/vrjuliao/swift-project/build/Ninja-DebugAssert/unified-swiftpm-build-linux-x86_64/debug/ \
-I /home/vrjuliao/swift-project/build/Ninja-DebugAssert/unified-swiftpm-build-linux-x86_64/debug/ \
-lSwiftSyntax -lSwiftSyntaxParser \
-L /home/vrjuliao/workfolder/swifit-project/swift-5.6-DEVELOPMENT-SNAPSHOT-2022-03-02-a-ubuntu20.04/usr/lib/swift/linux/ \
-I /home/vrjuliao/workfolder/swifit-project/swift-5.6-DEVELOPMENT-SNAPSHOT-2022-03-02-a-ubuntu20.04/usr/lib/swift/linux \
-l_InternalSwiftSyntaxParser \
AddOneToIntegerLiterals.swift
```