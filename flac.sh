summary="Free lossless audio codec"
homepage="https://xiph.org/flac"
url="https://github.com/xiph/flac/archive/1.3.3.tar.gz"
sha256="668cdeab898a7dd43cf84739f7e1f3ed6b35ece2ef9968a5c7079fe9adfe1689"
version="1.3.3"
dependencies="libogg libiconv"

#prepare() {
#    ./autogen.sh
#}

build2() {
    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DCMAKE_BUILD_TYPE=Release \
    -DOGG_INCLUDE_DIR="$libogg_DIR_INCLUDE" \
    -DOGG_LIBRARY="$libogg_DIR_LIB/libogg.a" \
    -DIntl_INCLUDE_DIR="" \
    -DIntl_LIBRARY="" \
    -DPKG_CONFIG_EXECUTABLE="" \
    -DBUILD_TESTING=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_CXXLIBS=ON \
    -DWITH_OGG=ON \
    -DWITH_ASM=OFF \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S "$DIR_SRC" \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" install
}

build() {
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
