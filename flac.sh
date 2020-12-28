summary "Free lossless audio codec"
webpage "https://xiph.org/flac"
src_url "https://github.com/xiph/flac/archive/1.3.3.tar.gz"
src_sum "668cdeab898a7dd43cf84739f7e1f3ed6b35ece2ef9968a5c7079fe9adfe1689"
depends "libogg libiconv"

prepare() {
    # 去掉libintl的查找
    cat > src/share/getopt/CMakeLists.txt <<EOF
check_include_file("string.h" HAVE_STRING_H)
add_library(getopt STATIC getopt.c getopt1.c)
EOF
}

build() {
    export CPPFLAGS="$CPPFLAGS -include stdint.h"
    cmake \
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
