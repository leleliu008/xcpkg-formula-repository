summary="Portable Foreign Function Interface library"
homepage="https://sourceware.org/libffi"
url="https://github.com/libffi/libffi/releases/download/v3.3/libffi-3.3.tar.gz"
sha256="72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056"

prepare() {
    # 参考src/aarch64/ffi.c中ffi_clear_cache的实现
    sed_in_place '/Forward declares/i static inline void __clear_cache (void *start, void *end) { sys_icache_invalidate (start, (char *)end - (char *)start); }' src/arm/ffi.c &&
    curl -L -o config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' config.sub
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --with-gcc-arch="$TARGET_ARCH" \
        --disable-multi-os-directory \
        --disable-symvers \
        --disable-debug \
        --disable-shared \
        --enable-static \
        --enable-docs \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CXX="$CXX" \
        CXXFLAGS="$CXXFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG='' && \
    make clean &&
    make install
}
