summary "Implementation of Telnet and SSH"
homepage "https://www.chiark.greenend.org.uk/~sgtatham/putty/"
url      "https://the.earth.li/~sgtatham/putty/0.74/putty-0.74.tar.gz"
sha256   "ddd5d388e51dd9e6e294005b30037f6ae802239a44c9dc9808c779e6d11b847d"

prepare() {
    inject_stub_system psftp.c cmdgen.c
}

build() {
    configure \
        --disable-gtktest \
        --without-gtk
}
