summary  "Low-level library for pixel manipulation"
homepage "https://cairographics.org"
url      "https://cairographics.org/releases/pixman-0.40.0.tar.gz"
sha256   "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
license  "LGPL-2.1"

prepare() {
    sed_in_place "/subdir('test')/d" meson.build &&
    sed_in_place 's/libpixman = library(/libpixman = static_library(/' pixman/meson.build
}

build() {
    meson
}
