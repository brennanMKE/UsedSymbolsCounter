# Used Symbols Counter

Run the build with the `Count` build scheme. Look though the output which is updated. Run `build.sh` to run a build with Release Configuration.

## Removing Data Store

In `Build.xcconfig` the setting below is defined. It can be commented out to remove the user of DataStore

```sh
SWIFT_ACTIVE_COMPILATION_CONDITIONS = $(inherited) USE_DATASTORE
```

## Known Issues

* Public symbols are never dead stripped: ([SR-521])
* Don't export public symbols from static libraries by default ([SR-1021])
* Why public symbols are always no_dead_strip? ([Swift Forums](https://forums.swift.org/t/why-public-symbols-are-always-no-dead-strip/47264))

## Tools

* nm
* otool
* symbols
* file

## Abstract Syntax Tree

The parser will produce the Abstract Syntax Tree (AST) which can provide the name of the module for all symbols used in a source file so tha that all uses of the SDK can be counted.

* [Dumping AST with Swift Compiler](https://stackoverflow.com/questions/37847271/is-it-possible-to-dump-the-ast-while-building-an-xcode-project)

---

[SR-521]: https://bugs.swift.org/browse/SR-521
[SR-1021]: https://bugs.swift.org/browse/SR-1021
