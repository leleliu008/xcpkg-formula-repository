package set summary "ISO9660+RR manipulation tool"
package set webpage "https://www.gnu.org/software/xorriso"
package set src.url "https://ftp.gnu.org/gnu/xorriso/xorriso-1.5.2.tar.gz"
package set src.sum "3b69f5c93ae7c40c5bbe4a847fa3963f5efc9c565551622f77121c5792fc17e7"
package set bsystem "configure"

build() {
    configure \
        --enable-libacl \
        --enable-xattr \
        --enable-zlib \
        --enable-libbz2 \
        --enable-libcdio \
        --enable-jtethreads
}
