package set summary "OpenType text shaping engine"
package set src.git "https://github.com/harfbuzz/harfbuzz.git"
package set src.url "https://github.com/harfbuzz/harfbuzz/archive/2.7.2.tar.gz"
package set src.sum "8ec112ee108642477478b75fc7906422abed404d7530e47ba0a4875f553f1b59"
package set license "MIT"
package set bsystem "meson"
package set dep.pkg "icu4c glib freetype2"
package set ldflags "-lbz2 -lz -lm -lbrotlidec -lbrotlicommon -lpng"

build() {
    mesonw \
        -Dicu=enabled \
        -Dglib=enabled \
        -Dfreetype=enabled \
        -Dgobject=disabled \
        -Dcairo=disabled \
        -Dfontconfig=disabled \
        -Dgraphite=disabled \
        -Dintrospection=disabled \
        -Dtests=disabled \
        -Ddocs=disabled \
        -Dbenchmark=disabled
}
