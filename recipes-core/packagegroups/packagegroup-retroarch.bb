DESCRIPTION = "RetroArch Package Groups"

inherit packagegroup

PACKAGES = "\
        ${PN} \
        "

RDEPENDS:${PN} = "\
        retroarch \
        retroarch-autoconfig \
        retroarch-assets-ozone \
        retroarch-assets-xmb-automatic \
        retroarch-assets-xmb-dot-art \
        retroarch-assets-xmb-flatui \
        retroarch-assets-xmb-monochrome \
        retroarch-assets-xmb-neoactive \
        retroarch-assets-xmb-pixel \
        retroarch-assets-xmb-retroactive \
        retroarch-assets-xmb-retrosystem \
        retroarch-assets-xmb-systematic \
        retroarch-autoconfig \
        retroarch-database-titles \
        retroarch-database-cursors \
        retroarch-libretro-info \
        retroarch-overlays \
        retroarch-glsl-shaders \
        "

