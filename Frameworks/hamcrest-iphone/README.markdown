Hamcrest is a library of matcher objects available from [http://code.google.com/p/hamcrest/](http://code.google.com/p/hamcrest/) This branch adds a static library built target for iPhone OS projects to link against.

## To install

* `git clone ...` or `git submodule add ...` this repository into your project.
* In Xcode's preferences' "building" tab place build products in a customized location and intermediate build files in with build products (or add the appropriate build folder to your projects library search path).
* Add "OCHamcrest.xcodeproj" to your project.
* Add the "libOCHamcrest.a" library as a direct dependency of your build target and to your target's "link binary with libraries" build phase.
* Add `-ObjC`, `-all_load`, and `-lstdc++` to your build target's "Other Linker Flags"
* `#import <OCHamcrest/OCHamcrest.h>`