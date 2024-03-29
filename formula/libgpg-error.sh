package set summary "Common error values for all GnuPG components"
package set webpage "https://www.gnupg.org/related_software/libgpg-error"
package set src.url "https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.44.tar.bz2"
package set src.sum "8e3d2da7a8b9a104dd8e9212ebe8e0daf86aa838cc1314ba6bc4de8f2d8a1ff9"
package set license "LGPL-2.1-or-later"
package set bsystem "configure"

copy_lock_obj_pub() {
    cp $SOURCE_DIR/src/syscfg/lock-obj-pub.$1-apple-darwin.h $SOURCE_DIR/src/syscfg/lock-obj-pub.darwin.h
}

copy_lock_obj_pub_() {
    case $TARGET_OS_ARCH in
        armv7*) copy_lock_obj_pub arm     ;;
        arm64*) copy_lock_obj_pub aarch64 ;;
        i386)   copy_lock_obj_pub i386    ;;
        x86_64) copy_lock_obj_pub x86_64  ;;
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
