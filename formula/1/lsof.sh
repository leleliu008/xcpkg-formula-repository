package set summary "Utility to list open files"
package set webpage "https://people.freebsd.org/~abe"
package set git.url "https://github.com/lsof-org/lsof.git"
package set src.url "https://github.com/lsof-org/lsof/archive/4.94.0.tar.gz"
package set src.sum "a9865eeb581c3abaac7426962ddb112ecfd86a5ae93086eb4581ce100f8fa8f4"
package set license "Zlib"
package set bsystem "make"

package set binsrcd 'yes'

build() {
    export LSOF_MAKE="make"
    export LSOF_CC="$CC"
    export LSOF_AR="$AR rcs"
    export LSOF_RANLIB="$RANLIB"
    export LSOF_ARCH="$TARGET_OS_ARCH"
    export LSOF_INCLUDE="$SYSTEM_INCLUDE_DIR"
    export LSOF_CFGF="$CFLAGS $CPPFLAGS"
    export LSOF_CFGL="$LDFLAGS -L$SOURCE_DIR/lib"
    
    run ./Configure -clean &&
    run ./Configure -n darwin &&
    makew &&
    run install_bins lsof &&
    run install_mans Lsof.8
}
