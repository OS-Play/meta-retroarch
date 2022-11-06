
RETROARCH_VERSION = "1.12.0"
SRCREV = "415925c5dc73e9f080d8edf36398434038648507"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = "file://init"

# FIXME: threaded video may cause black screen
RETROARCH_CONFIG_THREADED_VIDEO = "false"

RETROARCH_CONFIG_XMB_THEME_COLOR = "4"
RETROARCH_WIFI_DRIVER = "nmcli"
RETROARCH_BLUETOOTH_DRIVER = "bluetoothctl"
RETROARCH_DEFAULT_INPUT_DRIVER = "sdl2"
RETROARCH_DEFAULT_JOYPAD_DRIVER = "sdl2"

PACKAGECONFIG = " \
        ${RETROARCH_AUDIO_PACKAGECONFIG_DEFAULTS} \
        ${RETROARCH_CPU_PACKAGECONFIG_DEFAULTS} \
        ${RETROARCH_GRAPHICS_PACKAGECONFIG_DEFAULTS} \
        ${RETROARCH_MENU_PACKAGECONFIG_DEFAULTS} \
        ${RETROARCH_ONLINE_PACKAGECONFIG_DEFAULTS} \
        dbus \
        dynlib \
        ffmpeg \
        freetype \
        libshake \
        libusb \
        lto \
        menu-ozone \
        menu-xmb \
        mmap \
        network \
        networkgamepad \
        ssl \
        threads \
        threads-storage \
        udev \
        v4l2 \
        zlib \
        hid \
        wayland \
        glslang \
        ${@ bb.utils.filter('DISTRO_FEATURES', 'bluetooth', d) } \
        sdl2 \
"

PACKAGECONFIG[hid] = "--enable-hid,--disable-hid"
PACKAGECONFIG[bluetooth] = "--enable-bluetooth,"

inherit openrc-run

do_install:append() {
    install -d ${D}${sysconfdir}/init.d/
    install -Dm0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/retroarch
}

do_retroarch_config:append() {
    write_cfg "menu_show_restart_retroarch" "false"
    write_cfg "menu_show_quit_retroarch" "false"
    write_cfg "wifi_driver" "${RETROARCH_WIFI_DRIVER}"
    write_cfg "bluetooth_driver" "${RETROARCH_BLUETOOTH_DRIVER}"
}

RC_INITSCRIPT_NAME = "retroarch"
RC_INITSCRIPT_PARAMS = "default"
