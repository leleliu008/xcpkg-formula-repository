summary "Copies files into or out of a cpio or tar archive"
webpage "https://www.gnu.org/software/cpio"
src_url "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.bz2"
src_sum "eab5bdc5ae1df285c59f2a4f140a98fc33678a0bf61bdba67d9436ae26b46f6d"
bsystem "configure"

build() {
    configure --disable-mt
}
