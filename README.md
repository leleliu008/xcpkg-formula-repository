# ipkg-formula-repository
the offical formula repository for [ipkg](https://github.com/leleliu008/ipkg)

## what's formula
formula is a POSIX sh script used to describe how to compile a package for [ipkg](https://github.com/leleliu008/ipkg).

## the function must be invoked on top of the formula
```
package set <KEY> <VALUE>
```
|KEY|required?|overview|
|-|-|-|
|`summary`|required|the summary of this package.|
|`webpage`|optional|the home webpage of this package.<br>If this key is not present, `src.git` must be present.|
|`version`|optional|the version of this package.<br>If this key is not present, it will be calculated from `src.url`|
|`license`|optional|the license of this package.|
|`src.git`|optional|the source code git repository.<br>must end with `.git`|
|`src.url`|required|the source code download url of this package.<br>must end with one of `.git` `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz` `.c` `.cc` `.cxx` `.cpp`.<br>also support format like `dir://DIR`|
|`src.sum`|optional|the `sha256sum` of source code.<br>If the value of `src.url` end with `.git`, this key is optional, otherwise, this key must be present.|
|`dep.cmd`|optional|the commands will be used when installing. If specify multiple values, separate them with spaces.|
|`dep.pkg`|optional|the packages will be used when installing and runtime. If specify multiple values, separate them with spaces.|
|`patches`|optional|the patches. `URL` `SHA256` pairs. [example](https://github.com/leleliu008/ipkg-formula/blob/master/formula/unzip.sh#L9-L10)|
|`cdefine`|optional|append to `CPPFLAGS`|
|`ccflags`|optional|append to `CFLAGS`|
|`xxflags`|optional|append to `CXXFLAGS`|
|`ldflags`|optional|append to `LDFLAGS`|
|`sourced`|optional|the source directory, relative to `WORKING_DIR` which contains build script such as `configure`, `Makefile`, `CMakeLists.txt`, `meson.build`, `Cargo.toml`, etc.|
|`binsrcd`|optional|build in source directory, otherwise build out-of source directory.|
|`bsystem`|optional|build system.<br>values can be `autogen` `autotools` `configure` `cmake` `cmake-make` `cmake-ninja` `meson` `make` `ninja` `cargo` `go`|

## the function can be declared in a formula
|function|required?|overview|
|-|-|-|
|`prepare(){}`|optional|this function only run once.|
|`build0(){}`|optional|this function only run once. build for native.|
|`build(){}`|required|this function will run many times. each time build for one abi.|

## the function can be invoked in a formula at anywhere
|function|example|
|-|-|
|`print`|`print 'your message.'`|
|`echo`|`echo 'your message.'`|
|`info`|`info 'your infomation.'`|
|`warn`|`warn "--min-sdk-api-level=INTEGER argument is not specified. so, use the default value [21]."`|
|`error`|`error 'error message.'`|
|`die`|`die "please specify a package name."`|
|`success`|`success "build success."`|
|`nproc`|`make --directory="$BUILD_DIR" -j$(nproc)`|
|`sed_in_place`|`sed_in_place 's/-mandroid//g' Configure`|
|`format_unix_timestamp`|`format_unix_timestamp "$TIMESTAMP_UNIX" '+%Y/%m/%d %H:%M:%S'`|
|`getvalue`|`VALUE=$(getvalue --min-sdk-api-level=21)`|
|`sha256sum`|`VALUE=$(sha256sum FILEPATH)`|
|`is_sha256sum_match`|`is_sha256sum_match FILEPATH SHA256SUM`|
|`fetch`|`fetch URL [--sha256=SHA256] --output-path=PATH`<br>`fetch URL [--sha256=SHA256] --output-dir=DIR --output-name=NAME`<br>`fetch URL [--sha256=SHA256] --output-dir=DIR [--output-name=NAME]`<br>`fetch URL [--sha256=SHA256] [--output-dir=DIR] --output-name=NAME`|

## the function can be invoked in build function only
|function|example|
|-|-|
|`configure`|`configure --enable-pic`|
|`mesonw`|`mesonw -Dneon=disabled -Darm-simd=disabled`|
|`cmakew`|`cmakew -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON`|
|`makew`|`makew`|
|`cargo`|`cargo`|

## the variable can be used in a formula at anywhere
|variable|overview|
|-|-|
|`MY_VERSION`|the version of `ipkg`.|
|`MY_HOME_DIR`|the home directory of `ipkg`.|
|`MY_HOME_PAGE`|the home webpage of `ipkg`.|
|`MY_CACHED_DIR`|the downloads directory of `ipkg`.|
|`MY_INSTALL_DIR`|the installed directory of `ipkg`.|

## the variable can be used in prepare and build function
|variable|overview|
|-|-|
|`DEVELOPER_DIR`|the `Xcode` developer directory. `xcode-select -p`|
|`XCODE_VERSION`|the version of `Xcode`.|
|||
|`TIMESTAMP_UNIX`|the unix timestamp of this installation.|
|||
|`WORKING_DIR`|the direcotory where the source code tarball uncompressed to or copy to.|
|`SOURCE_DIR`|the source code directory of this installation. `the source code direcotory` is the direcotory who contains `Makefile` or `configure` or `CMakeLists.txt` or `meson.build` or `Cargo.toml`|
|||
|`CC`|the C Compiler.|
|`CFLAGS`|the flags of `CC`.|
|`CXX`|the C++ Compiler.|
|`CXXFLAGS`|the flags of `CXX`.|
|`CPP`|the C/C++ PreProcessor.|
|`CPPFLAGS`|the flags of `CPP`.|
|`AS`|the assembler.|
|`AR`|the archiver.|
|`RANLIB`|the archiver extra tool.|
|`LD`|the linker.|
|`LDFLAGS`|the flags of `LD`.|
|`NM`|a command line tool to list symbols from object files.|
|`STRIP`|a command line tool to discard symbols and other data from object files.|

## the variable can be used in build function only
|variable|overview|
|-|-|
|`BUILD_DIR`|the build directory of this abi.|
|`PKG_INSTALL_DIR`|the installation directory of this package.|
|`ABI_INSTALL_DIR`|the installation directory of this package of this abi.|
|`ABI_BINARY__DIR`|the `bin` directory of this package of this abi.|
|`ABI_INCLUDE_DIR`|the `include` directory of this package of this abi.|
|`ABI_LIBRARY_DIR`|the `lib` directory of this package of this abi.|
|`ABI_PKGCONF_DIR`|the `pkgconfig` directory of this package of this abi.|
|`x_INSTALL_DIR`|the installation directory of x package of this abi.|
|`x_INCLUDE_DIR`|the `include` directory of x package of this abi.|
|`x_LIBRARY_DIR`|the `lib` directory of x package of this abi.|
|||
|`TARGET_OS_NAME`|it's value may be one of `iPhoneOS`, `iPhoneSimulator`, `WatchOS`, `WatchSimulator`, `AppleTVOS`, `AppleTVSimulator`, `MacOSX`|
|`TARGET_OS_VERS`|min version of target os|
|`TARGET_OS_ARCH`|it's value may be one of `armv7`, `armv7s`, `armv7k`, `arm64`, `arm64e`, `arm64_32`, `i386`, `x86_64`|
|`TARGET_OS_ABI`|represents `$TARGET_OS_NAME/$TARGET_OS_ARCH`|
|`TARGET_TRIPLE`|it's value may be one of `armv7-apple-darwin`, `armv7s-apple-darwin`, `armv7k-apple-darwin`, `arm-apple-darwin`, `i386-apple-darwin`, `x86_64-apple-darwin`|
|||
|`SYSROOT`||
|`SYSTEM_INCLUDE_DIR`||
|`SYSTEM_LIBRARY_DIR`||
