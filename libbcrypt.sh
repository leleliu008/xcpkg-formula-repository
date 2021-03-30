summary "a simple wrapper providing a convenient reentrant interface for the bcrypt password hashing algorithm implementation as provided by Solar Designer at http://www.openwall.com/crypt"
src_git "https://github.com/leleliu008/libbcrypt.git"
bsystem "make"

build() {
    case $TARGET_OS_ARCH in
        x86_64) ENABLE_ASM=1 ;;
             *) ENABLE_ASM=0 ;;
    esac
    make -C "$SOURCE_DIR" clean &&
    make -C "$SOURCE_DIR" install \
        CC="$CC" \
        CFLAGS="'$CFLAGS'" \
        CPPFLAGS="'$CPPFLAGS'" \
        LDFLAGS="'$LDFLAGS'" \
        PREFIX="$ABI_INSTALL_DIR" \
        TARGET_ARCH="$TARGET_OS_ARCH" \
        ENABLE_ASM="$ENABLE_ASM"
}
