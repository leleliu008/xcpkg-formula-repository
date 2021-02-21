summary "Lightweight unit testing framework for C"
webpage "https://cunit.sourceforge.io"
src_url "https://downloads.sourceforge.net/project/cunit/CUnit/2.1-3/CUnit-2.1-3.tar.bz2"
src_sum "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
version "2.1.3"

prepare() {
    rm config.status &&
    find . -name ".deps"    -exec rm -rf {} + &&
    find . -name "Makefile" -exec rm -rf {} + &&
    autoreconf -ivf &&
    sed_in_place 's/install-data-am: install-dochdrDATA/install-data-am: /' doc/headers/Makefile.in
}

build() {
    configure \
        --disable-examples \
        --disable-test \
        --enable-basic \
        --disable-curses \
        --enable-console \
        --enable-memtrace \
        --enable-automated
}
