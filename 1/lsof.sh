summary "Utility to list open files"
webpage "https://people.freebsd.org/~abe"
src_git "https://github.com/lsof-org/lsof"
src_url "https://github.com/lsof-org/lsof/archive/4.94.0.tar.gz"
src_sum "a9865eeb581c3abaac7426962ddb112ecfd86a5ae93086eb4581ce100f8fa8f4"
license "Zlib"
bsystem "make"

build_in_sourced

build() {
    export LSOF_MAKE="make"
    export LSOF_CC="$CC"
    export LSOF_AR="$AR rcs"
    export LSOF_RANLIB="$RANLIB"
    export LSOF_ARCH="$BUILD_FOR_ARCH"
    export LSOF_INCLUDE="$SYSTEM_INCLUDE_DIR"
    export LSOF_CFGF="$CFLAGS $CPPFLAGS"
    export LSOF_CFGL="$LDFLAGS -L$SOURCE_DIR/lib"
    
    run ./Configure -clean &&
    run ./Configure -n darwin &&
    make &&
    run install_bins lsof &&
    run install_mans Lsof.8
}
