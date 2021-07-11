package set summary "Frontend for libraries libburn and libisofs"
package set webpage "https://www.libburnia-project.org"
package set src.url "http://files.libburnia-project.org/releases/libisoburn-1.5.2.tar.gz"
package set src.sum "cc720bc9511d8e0b09365e2c8b0e40817986be308cd96ca2705c807c955590ec"
package set bsystem "configure"
package set dep.pkg "libisofs libburn"

build() {
    configure \
        --enable-xattr \
        --enable-zlib \
        --disable-libcdio \
        --disable-libjte \
        --disable-libacl \
        --disable-libedit \
        --disable-libreadline
}
