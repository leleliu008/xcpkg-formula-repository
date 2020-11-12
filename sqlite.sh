version="3.32.1"
summary="Command-line interface for SQLite"
homepage="https://sqlite.org"
url="https://sqlite.org/2020/sqlite-autoconf-3320100.tar.gz"
sha256="486748abfb16abd8af664e3a5f03b228e5f124682b0c942e157644bf6fff7d10"

prepare() {
    gen_c_file_stub_system &&
    sed_in_place 's/system(/stub_system(/g' shell.c &&
    sed_in_place "1i #include \"$C_FILE_STUB_SYSTEM\"" shell.c
}

build() {
    configure \
        --enable-threadsafe \
        --disable-tcl \
        --disable-editline \
        --disable-readline \
        --disable-load-extension
}
