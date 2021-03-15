summary "GNU grep, egrep and fgrep"
webpage "https://www.gnu.org/software/grep"
src_url "https://ftp.gnu.org/gnu/grep/grep-3.4.tar.xz"
src_sum "58e6751c41a7c25bfc6e9363a41786cff3ba5709cf11d5ad903cf7cce31cc3fb"
license "GPL-3.0-or-later"
bsystem "configure"

build() {
    configure \
        --enable-threads=posix \
        --disable-assert \
        --disable-gcc-warnings \
        --with-included-regex
}
