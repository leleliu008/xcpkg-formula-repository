package set summary "High quality, portable, open source libm implementation"
package set webpage "https://openlibm.org"
package set git.url "https://github.com/JuliaMath/openlibm.git"
package set src.url "https://github.com/JuliaMath/openlibm/archive/v0.8.1.tar.gz"
package set src.sum "ba8a282ecd92d0033f5656bb20dfc6ea3fb83f90ba69291ac8f7beba42dcffcf"
package set bsystem "make"
package set dep.cmd "base64 patch"

prepare() {
    sed_in_place 's|-mhard-float||g' Make.inc &&
    echo "LS0tIE1ha2UuaW5jCTIwMjAtMTEtMjAgMTU6Mzk6MTMuMDAwMDAwMDAwICswODAwCisrKyBNYWtlLmluYy5uZXcJMjAyMC0xMS0yMCAxNjozNjo0NC4wMDAwMDAwMDAgKzA4MDAKQEAgLTU1LDE1ICs1NSwyNiBAQAogZW5kaWYKIAogIyBPUy1zcGVjaWZpYyBzdHVmZgorCiBpZmVxICgkKEFSQ0gpLGFybTY0KQotb3ZlcnJpZGUgQVJDSCA6PSBhYXJjaDY0Ci1lbmRpZgotaWZlcSAoJChmaW5kc3RyaW5nIGFybSwkKEFSQ0gpKSxhcm0pCi1vdmVycmlkZSBBUkNIIDo9IGFybQotTUFSQ0ggPz0gYXJtdjctYQotQ0ZMQUdTX2FkZCArPSAKLWVuZGlmCi1pZmVxICgkKGZpbmRzdHJpbmcgcG93ZXJwYywkKEFSQ0gpKSxwb3dlcnBjKQorICAgIG92ZXJyaWRlIEFSQ0ggOj0gYWFyY2g2NAorZWxzZSBpZmVxICgkKEFSQ0gpLGFybTY0ZSkKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFhcmNoNjQKK2Vsc2UgaWZlcSAoJChBUkNIKSxhcm02NF8zMikKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFhcmNoNjQKK2Vsc2UgaWZlcSAoJChBUkNIKSxhcm12NykKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFybQorICAgIE1BUkNIID89IGFybXY3LWEKKyAgICBDRkxBR1NfYWRkICs9IAorZWxzZSBpZmVxICgkKEFSQ0gpLGFybXY3cykKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFybQorICAgIE1BUkNIID89IGFybXY3LXMKKyAgICBDRkxBR1NfYWRkICs9IAorZWxzZSBpZmVxICgkKEFSQ0gpLGFybXY3aykKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFybQorICAgIE1BUkNIID89IGFybXY3LWsKKyAgICBDRkxBR1NfYWRkICs9IAorZWxzZSBpZmVxICgkKGZpbmRzdHJpbmcgcG93ZXJwYywkKEFSQ0gpKSxwb3dlcnBjKQogb3ZlcnJpZGUgQVJDSCA6PSBwb3dlcnBjCiBlbmRpZgogaWZlcSAoJChmaW5kc3RyaW5nIHBwYywkKEFSQ0gpKSxwcGMpCg==" | base64 -d | patch
}

build() {
    makew -C "$SOURCE_DIR" clean &&
    makew -C "$SOURCE_DIR" install \
        prefix="$TARGET_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="'$CFLAGS'" \
        CPPFLAGS="'$CPPFLAGS'" \
        LDFLAGS="'$LDFLAGS'" \
        AR="$AR" \
        OS=Darwin \
        ARCH="$TARGET_OS_ARCH"
}
