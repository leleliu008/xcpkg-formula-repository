package set summary "Free lossless audio codec"
package set webpage "https://xiph.org/flac"
package set git.url "https://github.com/xiph/flac.git"
package set src.url "https://github.com/xiph/flac/archive/1.3.4.tar.gz"
package set src.sum "53e9dbe3ae54a9f42c1e65afe7f516c02d8393c0c6d56bc455c15e1e044069a9"
package set dep.cmd "glibtoolize:libtoolize libtool"
package set dep.pkg "libogg"
package set bsystem "cmake"

prepare() {
    # 去掉libintl的查找
    cat > src/share/getopt/CMakeLists.txt <<EOF
check_include_file("string.h" HAVE_STRING_H)
add_library(getopt STATIC getopt.c getopt1.c)
EOF
}

build() {
    export CPPFLAGS="$CPPFLAGS -include stdint.h"
    cmakew \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_CXXLIBS=ON \
        -DENABLE_WERROR=OFF \
        -DWITH_XMMS=OFF \
        -DWITH_ASM=OFF \
        -DWITH_OGG=ON \
        -DOGG_INCLUDE_DIR="$libogg_INCLUDE_DIR" \
        -DOGG_LIBRARY="$libogg_LIBRARY_DIR/libogg.a"
}

build2() {
    configure \
        --with-ogg="$libogg_INSTALL_DIR" \
        --disable-oggtest \
        --disable-valgrind-testing \
        --disable-thorough-tests \
        --disable-exhaustive-tests \
        --disable-examples \
        --disable-xmms-plugin \
        --disable-doxygen-docs
}
