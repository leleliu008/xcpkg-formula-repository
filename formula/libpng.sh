package set summary "Library for manipulating PNG images"
package set webpage "http://www.libpng.org/pub/png/libpng.html"
package set src.url "https://downloads.sourceforge.net/libpng/libpng-1.6.37.tar.xz"
package set src.sum "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
package set bsystem "cmake"
package set dep.pkg "zlib"

build() {
    cmakew \
        -DPNG_STATIC=ON \
        -DPNG_SHARED=ON \
        -DPNG_TESTS=OFF \
        -DPNG_DEBUG=OFF \
        -DPNG_ARM_NEON=off \
        -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
        -DZLIB_LIBRARY="$zlib_LIBRARY_DIR/libz.a"
}
