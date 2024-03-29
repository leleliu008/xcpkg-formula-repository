package set summary "Utility that provides fast incremental file transfer"
package set webpage "https://rsync.samba.org"
package set git.url "https://github.com/WayneD/rsync.git"
package set src.url "https://rsync.samba.org/ftp/rsync/rsync-3.2.3.tar.gz"
package set src.sum "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
package set license "GPL-3.0"
package set dep.pkg "openssl popt lz4 zstd zlib xxhash libiconv"
package set bsystem "configure"

prepare() {
    inject_stub_system main.c
}

build() {
    configure --disable-simd --disable-asm
}
