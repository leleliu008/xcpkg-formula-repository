package set summary "C library implementing the SSH2 protocol"
package set webpage "https://libssh2.org"
package set src.url "https://libssh2.org/download/libssh2-1.9.0.tar.gz"
package set src.sum "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
package set bsystem "configure"
package set dep.pkg "libgcrypt zlib"

build() {
    configure \
        --disable-examples-build \
        --disable-werror \
        --with-crypto=libgcrypt \
        --with-libgcrypt-prefix="$libgcrypt_INSTALL_DIR" \
        --with-libz
}
