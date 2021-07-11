package set summary "Copies files into or out of a cpio or tar archive"
package set webpage "https://www.gnu.org/software/cpio"
package set src.url "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.bz2"
package set src.sum "eab5bdc5ae1df285c59f2a4f140a98fc33678a0bf61bdba67d9436ae26b46f6d"
package set bsystem "configure"

build() {
    configure --disable-mt
}
