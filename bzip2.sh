summary="Freely available high-quality data compressor"
homepage="https://sourceware.org/bzip2"
url="https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz"
sha256="ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"

build() {
    make clean > /dev/null 2>&1
    make install PREFIX="$DIR_INSTALL_PREFIX" CC="$CC" CFLAGS="$CFLAGS" AR="$AR" RANLIB="$RANLIB"
}
