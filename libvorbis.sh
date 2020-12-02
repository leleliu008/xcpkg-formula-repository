summary  "Vorbis General Audio Compression Codec"
homepage "https://xiph.org/vorbis"
url      "https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.6.tar.xz"
sha256   "af00bb5a784e7c9e69f56823de4637c350643deedaf333d0fa86ecdba6fcb415"
dependencies "libogg"

build() {
    export CPPFLAGS="$CPPFLAGS -include stdint.h"
    configure --with-ogg="$libogg_INSTALL_DIR"
}

build2() {
    cmake \
    -DOGG_INCLUDE_DIRS="$libogg_INCLUDE_DIR" \
    -DOGG_LIBRARIES="$libogg_LIBRARY_DIR/libogg.a"
}
