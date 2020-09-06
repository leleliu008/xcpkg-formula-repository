summary="High performance message passing library"
homepage="https://www.open-mpi.org"
url="https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.4.tar.bz2"
sha256="47e24eb2223fe5d24438658958a313b6b7a55bb281563542e1afc9dec4a31ac4"
dependencies="libevent"

prepare() {
    gen_c_file_stub_system &&
    
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" opal/tools/opal-restart/opal-restart.c &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" opal/mca/hwloc/hwloc201/hwloc/hwloc/dolib.c &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" opal/mca/pmix/pmix3x/pmix/examples/server.c &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" orte/tools/orte-clean/orte-clean.c &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" orte/test/mpi/ziatest.c &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" orte/mca/filem/raw/filem_raw_module.c &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" orte/mca/sstore/stage/sstore_stage_global.c &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" orte/mca/sstore/stage/sstore_stage_local.c &&
    
    sed_in_place "s/system(/stub_system(/g" opal/tools/opal-restart/opal-restart.c &&
    sed_in_place "s/system(/stub_system(/g" opal/mca/hwloc/hwloc201/hwloc/hwloc/dolib.c &&
    sed_in_place "s/system(/stub_system(/g" opal/mca/pmix/pmix3x/pmix/examples/server.c &&
    sed_in_place "s/system(/stub_system(/g" orte/tools/orte-clean/orte-clean.c &&
    sed_in_place "s/system(/stub_system(/g" orte/test/mpi/ziatest.c &&
    sed_in_place "s/system(/stub_system(/g" orte/mca/filem/raw/filem_raw_module.c &&
    sed_in_place "s/system(/stub_system(/g" orte/mca/sstore/stage/sstore_stage_global.c &&
    sed_in_place "s/system(/stub_system(/g" orte/mca/sstore/stage/sstore_stage_local.c &&

    fetch_config_sub &&
    fetch_config_guess && {
        for item in config/ opal/mca/pmix/pmix3x/pmix/config/ opal/mca/event/libevent2022/libevent/ ompi/mca/io/romio321/romio/confdb/
        do
            cp config.sub   $item &&
            cp config.guess $item
        done
    }
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --disable-debug \
        --disable-coverage \
        --disable-mpi-fortran \
        --disable-oshmem-fortran \
        --disable-builtin-atomics \
        --enable-sysv-shmem=no \
        --enable-sysv-sshmem=no \
        --enable-static \
        --enable-shared \
        --enable-binaries \
        --enable-mpi-java \
        --with-libevent="$libevent_DIR_INSTALL_PREFIX" \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CXX="$CXX" \
        CXXFLAGS="$CXXFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        FC='' \
        PKG_CONFIG='' && \
    make clean &&
    make install
}
