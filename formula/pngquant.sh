package set summary "PNG image optimizing utility"
package set webpage "https://pngquant.org"
package set git.url "https://github.com/kornelski/pngquant.git"
package set src.url "https://pngquant.org/pngquant-2.17.0-src.tar.gz"
package set src.sum "a27cf0e64db499ccb3ddae9b36036e881f78293e46ec27a9e7a86a3802fcda66"
package set dep.pkg "libpng lcms2"
package set dep.cmd "pkg-config"
package set bsystem "make"
package set binsrcd 'YES'

prepare() {
    sed_in_place 's/-mmacosx-version-min=10.7//g' configure &&
    sed_in_place 's/-mmacosx-version-min=10.7//g' lib/configure
}

build() {
    export OSTYPE=darwin

    run ./configure \
        --prefix="$ABI_INSTALL_DIR" \
        --disable-sse \
        --with-libpng="$libpng_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="'$CFLAGS $CPPFLAGS'" \
        LDFLAGS="'$LDFLAGS'" &&
    makew clean &&
    makew install
}
