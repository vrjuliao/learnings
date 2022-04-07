# Local complete build

## Command:

```sh
utils/build-script --foundation --libdispatch --skip-test-linux --install-foundation --install-libdispatch --skip-test-foundation=1 --skip-build-benchmarks --swiftsyntax --install-swiftsyntax --swiftpm --install-swiftpm --llbuild --install-swift --xctest --install-xctest --sccache
```

Not tested, but maybe the `--sccache` can help to speed up compilation.

## Help commands

- The following command helps us to handle the built toolchains path.
  ```bash
  export SWIFT="/home/vrjuliao/swift-project/build/Ninja-DebugAssert/toolchain-linux-x86_64/usr/bin"
  ```

- Add some standard flags for SwiftSyntax libraries
  ```bash
  export SWIFT_FLAGS="-L /home/vrjuliao/swift-project/build/Ninja-DebugAssert/unified-swiftpm-build-linux-x86_64/debug/ -I /home/vrjuliao/swift-project/build/Ninja-DebugAssert/unified-swiftpm-build-linux-x86_64/debug/"
  ```

## Build swift-syntax separately
```sh
/home/vrjuliao/swift-project/swift-syntax/build-script.py --build-dir /home/vrjuliao/swift-project/build/Ninja-DebugAssert/unified-swiftpm-build-linux-x86_64 --multiroot-data-file /home/vrjuliao/swift-project/swift/utils/build_swift/resources/SwiftPM-Unified-Build.xcworkspace --toolchain /home/vrjuliao/swift-project/build/Ninja-DebugAssert/toolchain-linux-x86_64/usr --filecheck-exec /home/vrjuliao/swift-project/build/Ninja-DebugAssert/llvm-linux-x86_64/bin/FileCheck
```

## Build swift syntax parser
```sh
utils/build-tooling-libs --release --no-assertions --build-dir /tmp/tooling-libs-build --install-prefix /home/vrjuliao/swift-project/build/Ninja-DebugAssert/toolchain-linux-x86_64/usr
```

## Compiling examples Code with swift syntax
1. AddOneToIntegerLiterals.swift
```sh
$SWIFT/swiftc \
-L /home/vrjuliao/swift-project/build/Ninja-DebugAssert/unified-swiftpm-build-linux-x86_64/debug/ \
-I /home/vrjuliao/swift-project/build/Ninja-DebugAssert/unified-swiftpm-build-linux-x86_64/debug/ \
-lSwiftSyntax -lSwiftSyntaxParser -l_InternalSwiftSyntaxParser \
AddOneToIntegerLiterals.swift
```

2. CodeGenerationUsingSwiftSyntaxBuilder.swift
```sh
$SWIFT/swiftc \
-L /home/vrjuliao/swift-project/build/Ninja-DebugAssert/unified-swiftpm-build-linux-x86_64/debug/ \
-I /home/vrjuliao/swift-project/build/Ninja-DebugAssert/unified-swiftpm-build-linux-x86_64/debug/ \
-lSwiftSyntaxBuilder \
CodeGenerationUsingSwiftSyntaxBuilder.swift
```
