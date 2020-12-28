summary "GNU awk utility"
webpage "https://www.gnu.org/software/gawk"
src_url "https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz"
src_sum "cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd"
license "GPL-3.0"
depends "mpfr"

prepare() {
    inject_stub_system builtin.c
}

build() {
    configure \
        --with-mpfr="$mpfr_INSTALL_DIR" \
        --enable-extensions \
        --enable-lint \
        --enable-mpfr \
        --disable-builtin-intdiv0
}
