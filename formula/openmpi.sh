package set summary "High performance message passing library"
package set webpage "https://www.open-mpi.org"
package set git.url "https://github.com/open-mpi/ompi.git"
package set src.url "https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.1.tar.bz2"
package set src.sum "e24f7a778bd11a71ad0c14587a7f5b00e68a71aa5623e2157bafee3d44c07cda"
package set license "BSD-3-Clause"
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
        --enable-shared \
        --with-libevent="$libevent_INSTALL_DIR" \
        FC=''
}
