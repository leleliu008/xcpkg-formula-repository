package set summary "Vorbis General Audio Compression Codec"
package set webpage "https://xiph.org/vorbis"
package set src.url "https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.6.tar.xz"
package set src.sum "af00bb5a784e7c9e69f56823de4637c350643deedaf333d0fa86ecdba6fcb415"
package set bsystem "configure"
package set dep.pkg "libogg"

build() {
    export CPPFLAGS="$CPPFLAGS -include stdint.h"
    configure --with-ogg="$libogg_INSTALL_DIR"
}

build2() {
    cmakew \
    -DOGG_INCLUDE_DIRS="$libogg_INCLUDE_DIR" \
    -DOGG_LIBRARIES="$libogg_LIBRARY_DIR/libogg.a"
}
