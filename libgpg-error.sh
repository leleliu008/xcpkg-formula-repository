summary="Common error values for all GnuPG components"
homepage="https://www.gnupg.org/related_software/libgpg-error"
url="https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.37.tar.bz2"
sha256="b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763"

prepare() {
    curl -L -o build-aux/config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o build-aux/config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' build-aux/config.sub
}

copy_lock_obj_pub() {
    cp src/syscfg/lock-obj-pub.$1-apple-darwin.h src/syscfg/lock-obj-pub.$2-ios-darwin.h
}

copy_lock_obj_pub_() {
    case $TARGET_ARCH in
        armv7|armv7s|armv7k)
            copy_lock_obj_pub arm $TARGET_ARCH;;
        arm64)
            copy_lock_obj_pub aarch64 arm;;
        arm64e|arm64_32)
            copy_lock_obj_pub aarch64 aarch64;;
        i386)
            copy_lock_obj_pub i386 i386;;
        x86_64)
            copy_lock_obj_pub x86_64 x86_64;;
    esac
}

build() {
    copy_lock_obj_pub_ &&
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --disable-build-timestamp \
        --disable-languages \
        --disable-tests \
        --disable-nls \
        --enable-static \
        --enable-shared \
        --enable-largefile \
        --enable-doc \
        --enable-threads=posix \
        --enable-werror \
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
