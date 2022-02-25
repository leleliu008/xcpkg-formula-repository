package set summary "QR Code generation"
package set webpage "https://fukuchi.org/works/qrencode"
package set git.url "https://github.com/fukuchi/libqrencode.git"
package set src.url "https://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.gz"
package set src.sum "da448ed4f52aba6bcb0cd48cac0dd51b8692bccc4cd127431402fca6f8171e8e"
package set license "LGPL-2.1-or-later"
package set dep.pkg "libpng"
package set bsystem "cmake"

build() {
    cmakew \
        -DWITH_TOOLS=ON \
        -DWITH_TESTS=OFF \
        -DWITHOUT_PNG=OFF \
        -DPNG_PNG_INCLUDE_DIR="$libpng_INCLUDE_DIR" \
        -DPNG_LIBRARY_RELEASE="$libpng_LIBRARY_DIR/libpng.a"
}

build2() {
    configure
}

create_framework() {
    mkdir -p "$DIR_INSTALL_PACKAGE/qrencode.framework/Headers"
    cp "$DIR_INSTALL_PACKAGE/iPhoneOS/armv7s/include/qrencode.h" "$DIR_INSTALL_PACKAGE/qrencode.framework/Headers"
    lipo -create -output "$DIR_INSTALL_PACKAGE/qrencode.framework/libqrencode.a" $(find "$DIR_INSTALL_PACKAGE" -name "*.a")
}
