package set summary "Standalone library of the Fraunhofer FDK AAC code from Android"
package set webpage "https://sourceforge.net/projects/opencore-amr"
package set git.url "https://git.code.sf.net/p/opencore-amr/fdk-aac.git"
package set src.url "https://downloads.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-2.0.2.tar.gz"
package set src.sum "c9e8630cf9d433f3cead74906a1520d2223f89bcd3fa9254861017440b8eb22f"
package set bsystem "configure"

build() {
    configure --disable-example
}
