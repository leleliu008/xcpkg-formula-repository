package set summary "Packet(TCP/IP) Capture libray"
package set webpage "https://www.tcpdump.org"
package set git.url "https://github.com/the-tcpdump-group/libpcap.git"
package set src.url "https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz"
package set src.url "dir:///var/folders/qx/hbp_drws5mz56zc16l07tskr0000gn/T/tmp.d3DBxLbu"
package set src.sum "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"
package set dep.cmd "flex bison"
package set bsystem "cmake"

build() {
    cmakew \
        -DCMAKE_OSX_ARCHITECTURES="$TARGET_OS_ARCH" \
        -DINET6=ON \
        -DENABLE_REMOTE=ON \
        -DBDEBUG=OFF \
        -DDISABLE_USB=OFF \
        -DDISABLE_SEPTEL=OFF \
        -DDISABLE_NETMAP=OFF \
        -DDISABLE_DBUS=ON \
        -DDISABLE_BLUETOOTH=OFF \
        -DDISABLE_DAG=ON \
        -DDISABLE_TC=ON \
        -DDISABLE_SNF=ON
}
