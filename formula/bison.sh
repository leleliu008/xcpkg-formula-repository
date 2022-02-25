package set summary "Yacc-compatible Parser generator"
package set webpage "https://www.gnu.org/software/bison"
package set src.url "https://ftp.gnu.org/gnu/bison/bison-3.8.2.tar.xz"
package set src.sum "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
package set license "GPL-3.0-or-later"
package set bsystem "configure"

build() {
    configure \
        --enable-yacc \
        --enable-relocatable \
        --enable-threads=posix \
        --disable-gcc-warnings \
        --disable-assert
}
