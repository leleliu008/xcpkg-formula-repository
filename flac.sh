summary="Free lossless audio codec"
homepage="https://xiph.org/flac"
url="https://github.com/xiph/flac/archive/1.3.3.tar.gz"
sha256="668cdeab898a7dd43cf84739f7e1f3ed6b35ece2ef9968a5c7079fe9adfe1689"
version="1.3.3"
dependencies="libogg libiconv"

prepare() {
    # 去掉libintl的查找
    cat > src/share/getopt/CMakeLists.txt <<EOF
check_include_file("string.h" HAVE_STRING_H)
add_library(getopt STATIC getopt.c getopt1.c)
EOF
}

build() {
    cmake \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_CXXLIBS=ON \
    -DENABLE_WERROR=OFF \
    -DWITH_XMMS=OFF \
    -DWITH_ASM=OFF \
    -DWITH_OGG=ON \
    -DOGG_INCLUDE_DIR="$libogg_DIR_INCLUDE" \
    -DOGG_LIBRARY="$libogg_DIR_LIB/libogg.a"
}

build2() {
    [ -d "$DIR_BUILD" ] || mkdir -p "$DIR_BUILD"
    cd "$DIR_BUILD"
    "$DIR_SRC/configure" \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-ogg="$libogg_DIR_INSTALL_PREFIX" \
        --disable-rpath \
        --disable-oggtest \
        --disable-valgrind-testing \
        --disable-thorough-tests \
        --disable-exhaustive-tests \
        --disable-examples \
        --disable-xmms-plugin \
        --disable-doxygen-docs \
        --disable-debug \
        --disable-shared \
        --enable-static \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    make clean &&
    make install
}
