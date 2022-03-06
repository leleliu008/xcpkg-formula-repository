package set summary "OpenType text shaping engine"
package set git.url "https://github.com/harfbuzz/harfbuzz.git"
package set src.url "https://github.com/harfbuzz/harfbuzz/archive/3.4.0.tar.gz"
package set src.sum "810bcd3d22fae3c2c18c3688455abc1cd0d7fb2fae25404890b0d77e6443bd0a"
package set license "MIT"
package set dep.pkg "icu4c glib freetype2"
package set bsystem "meson"
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
