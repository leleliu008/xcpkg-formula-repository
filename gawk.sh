summary  "GNU awk utility"
homepage "https://www.gnu.org/software/gawk"
url      "https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz"
sha256   "cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd"
license  "GPL-3.0"
dependencies "mpfr"

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
