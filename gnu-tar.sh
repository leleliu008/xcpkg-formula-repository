summary="GNU version of the tar archiving utility"
homepage="https://www.gnu.org/software/tar"
url="https://ftp.gnu.org/gnu/tar/tar-1.32.tar.gz"
sha256="b59549594d91d84ee00c99cf2541a3330fed3a42c440503326dab767f2fbb96c"
license="GPL-3.0"

build() {
    configure \
        --with-included-regex \
        --with-xattrs \
        --without-posix-acls \
        --without-selinux \
        --disable-acl \
        --disable-gcc-warnings
}
