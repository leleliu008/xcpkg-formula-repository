package set summary "a simple wrapper providing a convenient reentrant interface for the bcrypt password hashing algorithm implementation as provided by Solar Designer at http://www.openwall.com/crypt"
package set src.git "https://github.com/leleliu008/libbcrypt.git"
package set bsystem "make"

build() {
    case $TARGET_OS_ARCH in
        x86_64) ENABLE_ASM=1 ;;
             *) ENABLE_ASM=0 ;;
    esac
    makew -C "$SOURCE_DIR" clean &&
    makew -C "$SOURCE_DIR" install \
        CC="$CC" \
        CFLAGS="'$CFLAGS'" \
        CPPFLAGS="'$CPPFLAGS'" \
        LDFLAGS="'$LDFLAGS'" \
        PREFIX="$ABI_INSTALL_DIR" \
        TARGET_ARCH="$TARGET_OS_ARCH" \
        ENABLE_ASM="$ENABLE_ASM"
}
