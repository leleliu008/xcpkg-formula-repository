package set summary "Free (GNU) replacement for the Pico text editor"
package set webpage "https://www.nano-editor.org/"
package set src.url "https://www.nano-editor.org/dist/v6/nano-6.2.tar.xz"
package set src.sum "2bca1804bead6aaf4ad791f756e4749bb55ed860eec105a97fba864bc6a77cb3"
package set license "GPL-3.0-or-later"
package set dep.pkg "gettext file"
package set dep.cmd "pkg-config"
package set bsystem "configure"

build() {
    configure \
        --enable-utf8 \
        --enable-color \
        --enable-extra \
        --enable-nanorc \
        --enable-multibuffer
}
