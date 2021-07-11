package set summary "High performance message passing library"
package set webpage "https://www.open-mpi.org"
package set src.url "https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.4.tar.bz2"
package set src.sum "47e24eb2223fe5d24438658958a313b6b7a55bb281563542e1afc9dec4a31ac4"
package set bsystem "configure"
package set dep.pkg "libevent"

prepare() {
    inject_stub_system \
        opal/tools/opal-restart/opal-restart.c \
        opal/mca/hwloc/hwloc201/hwloc/hwloc/dolib.c \
        opal/mca/pmix/pmix3x/pmix/examples/server.c \
        orte/tools/orte-clean/orte-clean.c \
        orte/test/mpi/ziatest.c \
        orte/mca/filem/raw/filem_raw_module.c \
        orte/mca/sstore/stage/sstore_stage_global.c \
        orte/mca/sstore/stage/sstore_stage_local.c
}

build() {
    configure \
        --disable-coverage \
        --disable-mpi-fortran \
        --disable-oshmem-fortran \
        --disable-builtin-atomics \
        --enable-sysv-shmem=no \
        --enable-sysv-sshmem=no \
        --enable-binaries \
        --enable-mpi-java \
        --with-libevent="$libevent_INSTALL_DIR" \
        FC=''
}
