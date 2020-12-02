summary  "Image format providing lossless and lossy compression for web images"
homepage "https://developers.google.com/speed/webp"
url      "http://downloads.webmproject.org/releases/webp/libwebp-1.1.0.tar.gz"
sha256   "98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043"
dependencies "libpng libtiff libjpeg-turbo giflib"

build() {
    cmake \
    -DPNG_PNG_INCLUDE_DIR="$libpng_INCLUDE_DIR" \
    -DPNG_LIBRARY="$libpng_LIBRARY_DIR/libpng.a" \
    -DJPEG_INCLUDE_DIR="$libjpeg_turbo_INCLUDE_DIR" \
    -DJPEG_LIBRARY="$libjpeg_turbo_LIBRARY_DIR/libjpeg.a"\
    -DTIFF_INCLUDE_DIR="$libtiff_INCLUDE_DIR" \
    -DTIFF_LIBRARY="$libtiff_LIBRARY_DIR/libtiff.a" \
    -DGIF_INCLUDE_DIR="$giflib_INCLUDE_DIR" \
    -DGIF_LIBRARY="$giflib_LIBRARY_DIR/libgif.a"
}

build2() {
    configure \
        --enable-libwebpdecoder \
        --enable-swap-16bit-csp \
        --enable-libwebpmux \
        --with-pngincludedir="$libpng_INCLUDE_DIR" \
        --with-pnglibdir="$libpng_LIBRARY_DIR" \
        --with-jpegincludedir="$libjpeg_turbo_INCLUDE_DIR" \
        --with-jpeglibdir="$libjpeg_turbo_LIBRARY_DIR" \
        --with-tiffincludedir="$libtiff_INCLUDE_DIR" \
        --with-tifflibdir="$libtiff_LIBRARY_DIR" \
        --with-gifincludedir="$giflib_INCLUDE_DIR" \
        --with-giflibdir="$giflib_LIBRARY_DIR"
}
