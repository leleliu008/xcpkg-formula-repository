summary="Library to create an ISO-9660 filesystem with extensions like RockRidge or Joliet"
homepage="https://www.libburnia-project.org"
url="http://files.libburnia-project.org/releases/libisofs-1.5.2.tar.gz"
sha256="ef5a139600b3e688357450e52381e40ec26a447d35eb8d21524598c7b1675500"

build() {
    configure \
        --enable-xattr \
        --enable-zlib \
        --disable-libacl \
        --disable-verbose-debug
}
