package set summary "Implementation of Telnet and SSH"
package set webpage "https://www.chiark.greenend.org.uk/~sgtatham/putty/"
package set src.url "https://the.earth.li/~sgtatham/putty/0.74/putty-0.74.tar.gz"
package set src.sum "ddd5d388e51dd9e6e294005b30037f6ae802239a44c9dc9808c779e6d11b847d"
package set bsystem "configure"

prepare() {
    inject_stub_system psftp.c cmdgen.c
}

build() {
    configure \
        --disable-gtktest \
        --without-gtk
}
