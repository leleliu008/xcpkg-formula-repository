summary="Common error values for all GnuPG components"
homepage="https://www.gnupg.org/related_software/libgpg-error"
url="https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.37.tar.bz2"
sha256="b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763"

copy_lock_obj_pub() {
    cp $SOURCE_DIR/src/syscfg/lock-obj-pub.$1-apple-darwin.h $SOURCE_DIR/src/syscfg/lock-obj-pub.ios.h
}

copy_lock_obj_pub_() {
    case $BUILD_FOR_ARCH in
        armv7*)
            copy_lock_obj_pub arm ;;
        arm64*)
            copy_lock_obj_pub aarch64 ;;
        i386)
            copy_lock_obj_pub i386 ;;
        x86_64)
            copy_lock_obj_pub x86_64 ;;
    esac
}

build() {
    copy_lock_obj_pub_ &&
    configure \
        --disable-build-timestamp \
        --disable-languages \
        --disable-werror \
        --disable-tests \
        --enable-doc \
        --enable-threads=posix
}
