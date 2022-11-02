PACKAGES += "dinothawr-assets"

do_install:append() {
    install -d ${D}${datadir}/retroarch/bios/
    cp -r ${S}/dinothawr ${D}${datadir}/retroarch/bios/dinothawr/
}

FILES:dinothawr-assets += "${datadir}/retroarch/bios/dinothawr/"
RDEPENDS:${PN} += "dinothawr-assets"
