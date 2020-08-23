summary="C library to parse Metalink XML files"
homepage="https://launchpad.net/libmetalink"
url="https://launchpad.net/libmetalink/trunk/libmetalink-0.1.3/+download/libmetalink-0.1.3.tar.xz"
sha256="86312620c5b64c694b91f9cc355eabbd358fa92195b3e99517504076bf9fe33a"
dependencies="expat"
#dependencies="libxml2"

prepare() {
    curl -L -o config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' config.sub
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --with-libexpat=yes \
        --with-libxml2=no \
        --with-xml-prefix="$expat_DIR_INSTALL_PREFIX" \
        --disable-xmltest \
        --disable-shared \
        --enable-static \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS -lexpat" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG='' && \
    sed_in_place 's/#define HAVE_MALLOC 0/#define HAVE_MALLOC 1/' config.h &&
    sed_in_place 's/#define malloc rpl_malloc//' config.h &&
    make clean &&
    make install
}
