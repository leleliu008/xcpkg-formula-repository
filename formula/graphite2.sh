package set summary "Smart font renderer for non-Roman scripts"
package set webpage "https://graphite.sil.org"
package set git.url "https://github.com/silnrsi/graphite.git"
package set src.url "https://github.com/silnrsi/graphite/releases/download/1.3.14/graphite2-1.3.14.tgz"
package set src.sum "f99d1c13aa5fa296898a181dff9b82fb25f6cc0933dbaa7a475d8109bd54209d"
package set license "LGPL-2.1"
package set dep.pkg "freetype2"
package set bsystem "cmake"

prepare() {
    sed_in_place '/nolib_test/d' src/CMakeLists.txt
}
