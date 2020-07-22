# ipkg-formula
the formula repository for [ipkg](https://github.com/leleliu008/ipkg)

## what's formula
formula is a POSIX sh script used to describe how to compile a package for [ipkg](https://github.com/leleliu008/ipkg).

## the variable can be declared in a formula
|variable|required?|overview|
|-|-|-|
|`summary`|required|the summary of this package.|
|`homepage`|required|the homepage of this package.|
|`url`|required|the source code download url of this package.|
|`sha256`|required|the sha256sum of source code.|
|`version`|optional|the version of this package.|
|`dependencies`|optional|the dependencies of this package. If specify multiple values, separate them with spaces.|

## the variable can be used in a formula
|variable|overview|
|-|-|
|`TIMESTAMP_UNIX`|the unix timestamp of this installation.|
|||
|`IPKG_VERSION`|the version of ipkg.|
|`IPKG_HOME`|the home directory of ipkg.|
|||
|`DIR_DOWNLOAD`|the downloads directory of ipkg.|
|`DIR_PKG`|the pkg directory of ipkg.|
|`DIR_SRC`|the source code directory of this package.|
|`DIR_BUILD`|the build directory of this `TARGET_ARCH`.|
|`DIR_INSTALL_PACKAGE`|the installation directory of this package.|
|`DIR_INSTALL_PREFIX`|the installation directory of this `TARGET_ARCH`.|
|||
|`x_DIR_INSTALL_PREFIX`|the installation directory of x package.|
|`x_DIR_INCLUDE`|the include directory of x package.|
|`x_DIR_LIB`|the lib directory of x package.|
|||
|`DEVELOPER_DIR`|the `Xcode` developer directory. `xcode-select -p`|
|`XCODE_VERSION`|the version of `Xcode`.|
|||
|`TARGET_PLATFORM`|it's value may be one of `iPhoneOS`, `iPhoneSimulator`, `WatchOS`, `WatchSimulator`, `AppleTVOS`, `AppleTVSimulator`, `MacOSX`|
|`PLATFORM_MIN_VERSION`||
|`TARGET_HOST`|it's value may be one of `armv7-ios-darwin`, `armv7s-ios-darwin`, `armv7k-ios-darwin`, `arm-ios-darwin`, `i386-ios-darwin`, `x86_64-ios-darwin`|
|`TARGET_ARCH`|it's value may be one of `armv7`, `armv7s`, `armv7k`, `arm64`, `arm64e`, `arm64_32`, `i386`, `x86_64`|
|||
|`CMAKE_TOOLCHAIN_FILE`||
|`SYSROOT`||
|`CC`|the C Compiler for `TARGET_ARCH`.|
|`CFLAGS`|the flags of `CC`.|
|`CXX`|the C++ Compiler for `TARGET_ARCH`.|
|`CXXFLAGS`|the flags of `CXX`.|
|`CPP`|the C PreProcesser for `CC`.|
|`CPPFLAGS`|the flags of `CPP`.|
|`AS`|the assembler.|
|`AR`|the archiver.|
|`RANLIB`|the archiver extra tool.|
|`LD`|the linker.|
|`LDFLAGS`|the flags of `LD`.|
|`NM`|a command line tool to list symbols from object files.|
|`STRIP`|a command line tool to discard symbols and other data from object files.|

## the function can be declared in a formula
|function|required?|overview|
|-|-|-|
|`prepare`|optional|this function only run once.|
|`build`|required|this function will run many times. each time build for one `TARGET_ARCH`.|

## the function can be used in a formula
|function|example|
|-|-|
|`msg`|`msg 'your message\n'`|
|`info`|`info 'your infomation\n'`|
|`warn`|`warn "PLATFORM_MIN_VERSION is not set. use default value [8.0].\n"`|
|`error`|`error 'error message\n'`|
|`die`|`die "please provide a pkg name.\n"`|
|`success`|`success "build success.\n"`|
|`nproc`|`make --directory="$DIR_BUILD" -j$(nproc) install`|
|`sed_in_place`|`sed_in_place 's/system(/system2(/g' shell.c`<br>`sed_in_place '1i #include "system2.c"' shell.c`|
|`format_unix_timestamp`|`format_unix_timestamp "$TIMESTAMP_UNIX" '+%Y/%m/%d %H:%M:%S'`|
