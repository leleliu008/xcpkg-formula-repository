version="3.32.1"
summary="Command-line interface for SQLite"
homepage="https://sqlite.org"
url="https://sqlite.org/2020/sqlite-autoconf-3320100.tar.gz"
sha256="486748abfb16abd8af664e3a5f03b228e5f124682b0c942e157644bf6fff7d10"

prepare() {
    cat > system2.c <<EOF
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
sed_in_place 's/system(/system2(/g' shell.c &&
sed_in_place '1i #include "system2.c"' shell.c
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --enable-threadsafe \
        --enable-static \
        --disable-shared \
        --disable-editline \
        --disable-readline \
        --disable-debug \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" && \
    make clean &&
    make install
}
