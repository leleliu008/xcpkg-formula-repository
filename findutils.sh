summary "Collection of GNU find, xargs, and locate"
webpage "https://www.gnu.org/software/findutils"
src_url "https://ftp.gnu.org/gnu/findutils/findutils-4.7.0.tar.xz"
src_sum "c5fefbdf9858f7e4feb86f036e1247a54c79fc2d8e4b7064d5aaa1f47dfa789a"
license "GPL-3.0"
bsystem "configure"

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
