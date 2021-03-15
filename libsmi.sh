summary "Library to Access SMI MIB Information"
webpage "https://www.ibr.cs.tu-bs.de/projects/libsmi"
src_url "https://www.ibr.cs.tu-bs.de/projects/libsmi/download/libsmi-0.5.0.tar.gz"
src_sum "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"
bsystem "configure"

prepare() {
    sed_in_place '$i void createIdentifierRef(_YangNode *node, char* prefix, char* ident);' lib/yang-data.h &&
    sed_in_place '/#include "yang-data.h"/a #include "yang-check.h"' lib/parser-yang.y &&
    sed_in_place '/#include "smi-data.h"/a #include "smi-check.h"' lib/error.h
}

build_in_sourced
