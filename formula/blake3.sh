package set summary "Rust and C implementations of the BLAKE3 cryptographic hash function"
package set git.url "https://github.com/BLAKE3-team/BLAKE3.git"
package set src.url "https://github.com/BLAKE3-team/BLAKE3/archive/1.3.1.tar.gz"
package set src.sum "112becf0983b5c83efff07f20b458f2dbcdbd768fd46502e7ddd831b83550109"
package set license "CC0-1.0"
package set bsystem "make"
package set sourced "c"

build() {
    SRCS='blake3.c blake3_dispatch.c blake3_portable.c'
    
    case $TARGET_OS_ARCH in
        arm*)
            CPPFLAGS="$CPPFLAGS -DBLAKE3_USE_NEON"
            SRCS="$SRCS blake3_neon.c"
            ;;
        i386)
            SRCS="$SRCS blake3_sse2.c blake3_sse41.c blake3_avx2.c blake3_avx512.c" ;;
        x86_64)
            SRCS="$SRCS blake3_sse2_x86-64_unix.S blake3_sse41_x86-64_unix.S blake3_avx2_x86-64_unix.S blake3_avx512_x86-64_unix.S" ;;
    esac
    
    OBJS=''
    
    for item in $SRCS
    do
        (
            case $item in
                blake3_sse2.c)   export CFLAGS="$CFLAGS -msse2"   ;;
                blake3_sse41.c)  export CFLAGS="$CFLAGS -msse4.1" ;;
                blake3_avx2.c)   export CFLAGS="$CFLAGS -mavx2"   ;;
                blake3_avx512.c) export CFLAGS="$CFLAGS -mavx512f -mavx512vl"
            esac
            run "$CC $CFLAGS $CPPFLAGS -c -o $item.o $SOURCE_DIR/$item" || return 1
        )
        OBJS="$item.o $OBJS"
    done
    
    run "$CC $LDFLAGS -shared -o libblake3.dylib $OBJS" &&
    run "$AR rs libblake3.a $OBJS" &&
    run install_incs "$SOURCE_DIR/blake3.h" &&
    run install_libs libblake3.a libblake3.dylib
}
