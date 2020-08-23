summary="Library to Access SMI MIB Information"
homepage="https://www.ibr.cs.tu-bs.de/projects/libsmi"
url="https://www.ibr.cs.tu-bs.de/projects/libsmi/download/libsmi-0.5.0.tar.gz"
mirror="https://www.mirrorservice.org/sites/distfiles.macports.org/libsmi/libsmi-0.5.0.tar.gz"
sha256="f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"

prepare() {
    curl -L -o config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' config.sub &&
    sed_in_place '$i void createIdentifierRef(_YangNode *node, char* prefix, char* ident);' lib/yang-data.h &&
    sed_in_place '/#include "yang-data.h"/a #include "yang-check.h"' lib/parser-yang.y &&
    sed_in_place '/#include "smi-data.h"/a #include "smi-check.h"' lib/error.h
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --enable-static \
        --disable-shared \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG='' && \
    make clean &&
    make install
}
