package set summary "Optimized BLAS library"
package set webpage "https://www.openblas.net"
package set src.git "https://github.com/xianyi/OpenBLAS.git"
package set src.url "https://github.com/xianyi/OpenBLAS/archive/v0.3.13.tar.gz"
package set src.sum "79197543b17cc314b7e43f7a33148c308b0807cd6381ee77f77e15acf3e6459e"
package set license "BSD-3-Clause"
package set bsystem "make"

package set binsrcd true

build() {
    # https://github.com/xianyi/OpenBLAS/wiki/How-to-build-OpenBLAS-for-Android
    case $TARGET_OS_ARCH in
        armv7*) ARCH=arm   ; TARGET='ARMV7' ; BINARY=32 ; ARM_SOFTFP_ABI=1 ;;
        arm64*) ARCH=arm64 ; TARGET='ARMV8' ; BINARY=64 ; ARM_SOFTFP_ABI=1 ;;
        i386)   ARCH=x86   ; TARGET='ATOM'  ; BINARY=32 ; ARM_SOFTFP_ABI=1 ;;
        x86_64) ARCH=x86_64; TARGET='ATOM'  ; BINARY=64 ; ARM_SOFTFP_ABI=1 ;;
    esac
    makew clean OSNAME=Darwin ARCH=$ARCH TARGET=$TARGET HOSTCC="$CC_FOR_BUILD" &&
    makew       OSNAME=Darwin ARCH=$ARCH TARGET=$TARGET HOSTCC="$CC_FOR_BUILD" ONLY_CBLAS=1 ARM_SOFTFP_ABI=$ARM_SOFTFP_ABI CC="$CC" AR="$AR" &&
    makew install PREFIX="$ABI_INSTALL_DIR"
}
