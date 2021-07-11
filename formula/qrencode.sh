package set summary "QR Code generation"
package set webpage "https://fukuchi.org/works/qrencode"
package set src.url "https://fukuchi.org/works/qrencode/qrencode-4.0.2.tar.gz"
package set src.sum "dbabe79c07614625d1f74d8c0ae2ee5358c4e27eab8fd8fe31f9365f821a3b1d"
package set bsystem "cmake"
package set dep.pkg "libpng"

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
