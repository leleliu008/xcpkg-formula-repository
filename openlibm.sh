summary "High quality, portable, open source libm implementation"
webpage "https://openlibm.org"
src_url "https://github.com/JuliaMath/openlibm/archive/v0.7.3.tar.gz"
src_sum "d3bcc4ef21c033a0cc408a30186bb3dbe21219e0c52d328ca70eb688cf867354"
bsystem "make"
require "base64 patch"

prepare() {
    sed_in_place 's|-mhard-float||g' Make.inc &&
    echo "LS0tIE1ha2UuaW5jCTIwMjAtMTEtMjAgMTU6Mzk6MTMuMDAwMDAwMDAwICswODAwCisrKyBNYWtlLmluYy5uZXcJMjAyMC0xMS0yMCAxNjozNjo0NC4wMDAwMDAwMDAgKzA4MDAKQEAgLTU1LDE1ICs1NSwyNiBAQAogZW5kaWYKIAogIyBPUy1zcGVjaWZpYyBzdHVmZgorCiBpZmVxICgkKEFSQ0gpLGFybTY0KQotb3ZlcnJpZGUgQVJDSCA6PSBhYXJjaDY0Ci1lbmRpZgotaWZlcSAoJChmaW5kc3RyaW5nIGFybSwkKEFSQ0gpKSxhcm0pCi1vdmVycmlkZSBBUkNIIDo9IGFybQotTUFSQ0ggPz0gYXJtdjctYQotQ0ZMQUdTX2FkZCArPSAKLWVuZGlmCi1pZmVxICgkKGZpbmRzdHJpbmcgcG93ZXJwYywkKEFSQ0gpKSxwb3dlcnBjKQorICAgIG92ZXJyaWRlIEFSQ0ggOj0gYWFyY2g2NAorZWxzZSBpZmVxICgkKEFSQ0gpLGFybTY0ZSkKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFhcmNoNjQKK2Vsc2UgaWZlcSAoJChBUkNIKSxhcm02NF8zMikKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFhcmNoNjQKK2Vsc2UgaWZlcSAoJChBUkNIKSxhcm12NykKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFybQorICAgIE1BUkNIID89IGFybXY3LWEKKyAgICBDRkxBR1NfYWRkICs9IAorZWxzZSBpZmVxICgkKEFSQ0gpLGFybXY3cykKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFybQorICAgIE1BUkNIID89IGFybXY3LXMKKyAgICBDRkxBR1NfYWRkICs9IAorZWxzZSBpZmVxICgkKEFSQ0gpLGFybXY3aykKKyAgICBvdmVycmlkZSBBUkNIIDo9IGFybQorICAgIE1BUkNIID89IGFybXY3LWsKKyAgICBDRkxBR1NfYWRkICs9IAorZWxzZSBpZmVxICgkKGZpbmRzdHJpbmcgcG93ZXJwYywkKEFSQ0gpKSxwb3dlcnBjKQogb3ZlcnJpZGUgQVJDSCA6PSBwb3dlcnBjCiBlbmRpZgogaWZlcSAoJChmaW5kc3RyaW5nIHBwYywkKEFSQ0gpKSxwcGMpCg==" | base64 -d | patch
}

build() {
    make -C "$SOURCE_DIR" clean &&
    make -C "$SOURCE_DIR" install \
        prefix="$ABI_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="'$CFLAGS'" \
        CPPFLAGS="'$CPPFLAGS'" \
        LDFLAGS="'$LDFLAGS'" \
        AR="$AR" \
        OS=Darwin \
        ARCH="$BUILD_FOR_ARCH"
}
