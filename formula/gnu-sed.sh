package set summary "GNU implementation of the famous stream editor"
package set webpage "https://www.gnu.org/software/sed"
package set src.url "https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz"
package set src.sum "f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633"
package set license "GPL-3.0"
package set bsystem "configure"

build() {
    configure \
        --without-selinux \
        --with-included-regex \
        --disable-acl \
        --disable-assert \
        --disable-gcc-warnings
}
