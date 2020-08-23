summary="Cryptographic library based on the code from GnuPG"
homepage="https://gnupg.org/related_software/libgcrypt"
url="https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.6.tar.bz2"
sha256="0cba2700617b99fc33864a0c16b1fa7fdf9781d9ed3509f5d767178e5fd7b975"
dependencies="libgpg-error"

prepare() {
    cat > tests/system2.c <<EOF
#ifndef SYSTEM2_C
#define SYSTEM2_C
#include <stdlib.h>
#include <unistd.h>
#include <spawn.h>
#include <sys/wait.h>

extern char **environ;

int system2(char *cmd) {
  char const *argv[] = {"sh", "-c", cmd, NULL};

  pid_t pid;
  int status;
  status = posix_spawn(&pid, "/bin/sh", NULL, NULL, argv, environ);
  if (0 == status) {
      return waitpid(pid, &status, 0);
  }
  return status;
}
#endif
EOF
    sed_in_place 's/system (/system2 (/g' tests/random.c &&
    sed_in_place '1i #include "system2.c"' tests/random.c &&
    curl -L -o build-aux/config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o build-aux/config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' build-aux/config.sub
}

build() {
    case $TARGET_ARCH in
        arm64e|x86_64)
            EXTRA_OPT='--disable-asm';;
        *)  EXTRA_OPT='--enable-asm'
    esac
    
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --with-libgpg-error-prefix="$libgpg_error_DIR_INSTALL_PREFIX" \
        --disable-doc \
        --enable-static \
        --enable-shared \
        --enable-optimization \
        "$EXTRA_OPT" \
        CC_FOR_BUILD=/usr/bin/cc \
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
