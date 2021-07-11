package set summary "Library to create an ISO-9660 filesystem with extensions like RockRidge or Joliet"
package set webpage "https://www.libburnia-project.org"
package set src.url "http://files.libburnia-project.org/releases/libisofs-1.5.2.tar.gz"
package set src.sum "ef5a139600b3e688357450e52381e40ec26a447d35eb8d21524598c7b1675500"
package set bsystem "configure"
package set build_in_parallel false

build() {
    configure \
        --enable-xattr \
        --enable-zlib \
        --disable-libacl \
        --disable-verbose-debug
}
