package set summary "Collection of GNU find, xargs, and locate"
package set webpage "https://www.gnu.org/software/findutils"
package set src.url "https://ftp.gnu.org/gnu/findutils/findutils-4.9.0.tar.xz"
package set src.sum "a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe"
package set license "GPL-3.0"
package set bsystem "configure"

prepare() {
    sed_in_place 's/find.texi\ //' doc/Makefile.am &&
    sed_in_place 's/find.texi\ //' doc/Makefile.in
}

build() {
    configure \
        --without-selinux \
        --with-included-regex \
        --enable-threads=posix \
        --enable-leaf-optimisation \
        --enable-d_type-optimisation \
        --disable-assert
}
