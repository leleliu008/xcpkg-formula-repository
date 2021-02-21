summary "Network authentication protocol"
webpage "https://web.mit.edu/kerberos"
src_url "https://kerberos.org/dist/krb5/1.18/krb5-1.18.3.tar.gz"
src_sum "e61783c292b5efd9afb45c555a80dd267ac67eebabca42185362bee6c4fbd719"
sourced "src"
require "make"
depends "readline openssl berkeley-db"

prepare() {
    #sed_in_place '/search_paths_first"/d' configure && 
    {
        for item in $(grep '<db.h>' -rl plugins/kdb/db2)
        do
            sed_in_place 's|<db.h>|<db_185.h>|g' "$item" || return 1
        done
    }
    inject_stub_system util/ss/execute_cmd.c
}

build() {
    export LDFLAGS="$LDFLAGS -lncurses"
    configure \
        --disable-static \
        --enable-dns-for-realm \
        --without-system-verto \
        --with-readline \
        --with-netlib=-lc \
        --with-size-optimizations \
        --with-system-db \
        krb5_cv_attr_constructor_destructor='yes,yes' \
        ac_cv_func_regcomp=yes \
        ac_cv_printf_positional=yes \
        ac_cv_lib_readline_main=yes
}