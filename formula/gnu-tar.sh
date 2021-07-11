package set summary "GNU package set version of the tar archiving utility"
package set webpage "https://www.gnu.org/software/tar"
package set src.url "https://ftp.gnu.org/gnu/tar/tar-1.32.tar.gz"
package set src.sum "b59549594d91d84ee00c99cf2541a3330fed3a42c440503326dab767f2fbb96c"
package set license "GPL-3.0"
package set bsystem "configure"

build() {
    configure \
        --with-included-regex \
        --with-xattrs \
        --without-posix-acls \
        --without-selinux \
        --disable-acl \
        --disable-gcc-warnings
}
