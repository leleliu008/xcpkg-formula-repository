summary="Library for manipulating pipelines of subprocesses in a flexible and convenient way"
homepage="http://libpipeline.nongnu.org"
url="http://download.savannah.nongnu.org/releases/libpipeline/libpipeline-1.5.2.tar.gz"
sha256="fd59c649c1ae9d67604d1644f116ad4d297eaa66f838e3dfab96b41e85b059fb"

prepare() {
    fetch "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD"   --output-file=build-aux/config.sub &&
    fetch "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" --output-file=build-aux/config.guess &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' build-aux/config.sub
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --disable-rpath \
        --disable-shared \
        --enable-static \
        --enable-largefile \
        --enable-threads=posix \
        --enable-socketpair-pipe \
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
