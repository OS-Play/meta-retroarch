DESCRIPTION = "Libretro Core Package Groups for RetroArch"

inherit packagegroup

PACKAGES = "\
        ${PN} \
        "

RDEPENDS:${PN} = "\
        snes9x-libretro \
        nestopia-libretro \
        "

RDEPENDS:${PN} += "\
        2048-libretro \
        dinothawr-libretro \
        superflappybirds-libretro \
        "
