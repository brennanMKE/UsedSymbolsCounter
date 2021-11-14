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

---

[SR-521]: https://bugs.swift.org/browse/SR-521
[SR-1021]: https://bugs.swift.org/browse/SR-1021
