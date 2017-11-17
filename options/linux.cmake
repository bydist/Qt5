
include("${CMAKE_CURRENT_LIST_DIR}/_unix.cmake")

byd__Qt5__configure__add_args(${package} -system-zlib)
byd__Qt5__configure__add_args(${package} -mtdev)
byd__Qt5__configure__add_args(${package} -no-journald)
byd__Qt5__configure__add_args(${package} -no-syslog)
byd__Qt5__configure__add_args(${package} -system-libpng)
byd__Qt5__configure__add_args(${package} -system-libjpeg)
byd__Qt5__configure__add_args(${package} -qt-doubleconversion)
byd__Qt5__configure__add_args(${package} -qt-freetype)
byd__Qt5__configure__add_args(${package} -qt-harfbuzz)
byd__Qt5__configure__add_args(${package} -openssl)
#byd__Qt5__configure__add_args(${package} -libproxy)
byd__Qt5__configure__add_args(${package} -qt-pcre)
byd__Qt5__configure__add_args(${package} -qt-xcb)
byd__Qt5__configure__add_args(${package} -qt-xkbcommon-x11)
byd__Qt5__configure__add_args(${package} -xkbcommon-evdev)
byd__Qt5__configure__add_args(${package} -xinput2)
byd__Qt5__configure__add_args(${package} -xcb-xlib)
byd__Qt5__configure__add_args(${package} -glib)
byd__Qt5__configure__add_args(${package} -pulseaudio)
byd__Qt5__configure__add_args(${package} -alsa)
byd__Qt5__configure__add_args(${package} -gtk)


byd__Qt5__configure__add_args(${package} -no-cups)
byd__Qt5__configure__add_args(${package} -iconv)
byd__Qt5__configure__add_args(${package} -evdev)
byd__Qt5__configure__add_args(${package} -no-tslib)
byd__Qt5__configure__add_args(${package} -icu)
byd__Qt5__configure__add_args(${package} -fontconfig)
byd__Qt5__configure__add_args(${package} -strip)
byd__Qt5__configure__add_args(${package} -no-pch)
byd__Qt5__configure__add_args(${package} -no-ltcg)
byd__Qt5__configure__add_args(${package} -dbus-linked)
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
   byd__Qt5__configure__add_args(${package} -use-gold-linker)
endif()
byd__Qt5__configure__add_args(${package} -xcb)
byd__Qt5__configure__add_args(${package} -eglfs)
byd__Qt5__configure__add_args(${package} -no-kms)
byd__Qt5__configure__add_args(${package} -no-gbm)
byd__Qt5__configure__add_args(${package} -no-directfb)
byd__Qt5__configure__add_args(${package} -linuxfb)
byd__Qt5__configure__add_args(${package} -no-mirclient)

byd__Qt5__configure__add_args(${package} -opengl)
byd__Qt5__configure__add_args(${package} -libinput)
byd__Qt5__configure__add_args(${package} -gstreamer)
byd__Qt5__configure__add_args(${package} -no-system-proxies)
