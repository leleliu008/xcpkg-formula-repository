summary="CDDB server access library"
homepage="https://libcddb.sourceforge.io"
url="https://downloads.sourceforge.net/project/libcddb/libcddb/1.3.2/libcddb-1.3.2.tar.bz2"
sha256="35ce0ee1741ea38def304ddfe84a958901413aa829698357f0bee5bb8f0a223b"

build() {
    configure \
        ac_cv_func_malloc_0_nonnull=yes \
        ac_cv_func_realloc_0_nonnull=yes
}
