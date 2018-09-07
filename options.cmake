
if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
    set(LINUX 1)
else()
    set(LINUX 0)
endif()




byd__Qt5__configure__add_args(${package} -accessibility)

byd__Qt5__configure__add_args(${package} -recheck)

if(CMAKE_INSTALL_PREFIX)
    byd__Qt5__configure__add_args(${package} "-I" "${CMAKE_INSTALL_PREFIX}/include")
    byd__Qt5__configure__add_args(${package} "-L" "${CMAKE_INSTALL_PREFIX}/lib")
endif()

if(UNIX)
    byd__Qt5__configure__add_args(${package} -rpath)
endif()


byd__Qt5__configure__add_args(${package} -strip)
byd__Qt5__configure__add_args(${package} -reduce-exports)


# Qt 5.11.1 fail to link with gold linker when build with clang 6.0 or GCC 6.3.0
byd__Qt5__configure__add_args(${package} -no-use-gold-linker)


# -- Core options:
byd__Qt5__configure__add_args(${package} -qt-doubleconversion)
if(LINUX)
    byd__Qt5__configure__add_args(${package} -no-glib)
    byd__Qt5__configure__add_args(${package} -no-eventfd)
    byd__Qt5__configure__add_args(${package} -no-inotify)
    byd__Qt5__configure__add_args(${package} -no-iconv)
endif()
byd__Qt5__configure__add_args(${package} -icu)
byd__Qt5__configure__add_args(${package} -qt-pcre)
#byd__Qt5__configure__add_args(${package} -qt-pps)
byd__Qt5__configure__add_args(${package} -system-zlib)

#    -- Logging backends:
if(LINUX)
    byd__Qt5__configure__add_args(${package} -no-journald)
    byd__Qt5__configure__add_args(${package} -no-syslog)
endif()
#byd__Qt5__configure__add_args(${package} -no-slog2)

# -- Network options:
byd__Qt5__configure__add_args(${package} -ssl)
if(APPLE)
    byd__Qt5__configure__add_args(${package} -securetransport)
else()
    byd__Qt5__configure__add_args(${package} -openssl)
    byd__Qt5__configure__add_args(${package} -openssl-linked)
endif()

byd__Qt5__configure__add_args(${package} -no-sctp)

byd__Qt5__configure__add_args(${package} -no-libproxy)
byd__Qt5__configure__add_args(${package} -system-proxies)


# -- Gui, printing, widget options:

if(UNIX)
    byd__Qt5__configure__add_args(${package} -no-cups)
endif()

if(LINUX)
    byd__Qt5__configure__add_args(${package} -fontconfig)
    byd__Qt5__configure__add_args(${package} -system-freetype)
    byd__Qt5__configure__add_args(${package} -system-harfbuzz)
else()
    byd__Qt5__configure__add_args(${package} -qt-freetype)
    byd__Qt5__configure__add_args(${package} -qt-harfbuzz)
endif()


if(LINUX)
    byd__Qt5__configure__add_args(${package} -no-gtk)
endif()
#byd__Qt5__configure__add_args(${package} -lgmon)

#byd__Qt5__configure__add_args(${package} -no-opengl)
if(UNIX)
    set(OPENGL_API desktop)
else()
    set(OPENGL_API dynamic)
endif()
byd__Qt5__configure__add_args(${package} -opengl ${OPENGL_API})
#byd__Qt5__configure__add_args(${package} -opengles3)
if(MSVC)
    byd__Qt5__configure__add_args(${package} -angle)
    byd__Qt5__configure__add_args(${package} -no-combined-angle-lib)
endif()

if(WIN32)
    set(QPA_BACKEND windows)
elseif(APPLE)
    set(QPA_BACKEND cocoa)
else()
    set(QPA_BACKEND xcb)
endif()
byd__Qt5__configure__add_args(${package} -qpa ${QPA_BACKEND})
if(LINUX)
    byd__Qt5__configure__add_args(${package} -xcb-xlib)
endif()

#    -- Platform backends:
if(WIN32)
    byd__Qt5__configure__add_args(${package} -direct2d)
endif()
if(UNIX)
    byd__Qt5__configure__add_args(${package} -no-directfb)
endif()
if((NOT WIN32) AND (NOT ANDROID))
    byd__Qt5__configure__add_args(${package} -no-eglfs)
endif()
if(UNIX)
    byd__Qt5__configure__add_args(${package} -no-gbm)
    byd__Qt5__configure__add_args(${package} -no-kms)
    byd__Qt5__configure__add_args(${package} -no-linuxfb)
    byd__Qt5__configure__add_args(${package} -no-mirclient)
endif()
if(LINUX)
    byd__Qt5__configure__add_args(${package} -qt-xcb)
endif()

#    -- Input backends:
if(LINUX)
    byd__Qt5__configure__add_args(${package} -no-evdev)
    #byd__Qt5__configure__add_args(${package} -imf)

    byd__Qt5__configure__add_args(${package} -no-libinput)
    byd__Qt5__configure__add_args(${package} -no-mtdev)
    byd__Qt5__configure__add_args(${package} -no-tslib)
    byd__Qt5__configure__add_args(${package} -no-xinput2)
    byd__Qt5__configure__add_args(${package} -qt-xkbcommon-x11)
    byd__Qt5__configure__add_args(${package} -no-xkbcommon-evdev)
endif()

#    -- Image formats:
byd__Qt5__configure__add_args(${package} -gif)
byd__Qt5__configure__add_args(${package} -ico)
byd__Qt5__configure__add_args(${package} -system-libpng)
byd__Qt5__configure__add_args(${package} -system-libjpeg)

# -- Database options:

byd__Qt5__configure__add_args(${package} -qt-sqlite)

# -- Qt3D options:

# -- Multimedia options:

if(LINUX)
    byd__Qt5__configure__add_args(${package} -pulseaudio)
    byd__Qt5__configure__add_args(${package} -no-alsa)
    byd__Qt5__configure__add_args(${package} -gstreamer)
endif()

if(WIN32)
    # we don't use directshow, so no new codec should be installed by end-user and be use in our application,
    # but if end-user try to open a video on windows, WindowsMediaPlayer is used by default and work as welle as our applications
    byd__Qt5__configure__add_args(${package} -mediaplayer-backend wmf)
endif()

# -- Webengine options:
if(LINUX)
    byd__Qt5__configure__add_args(${package} -no-webengine-alsa)
    byd__Qt5__configure__add_args(${package} -webengine-pulseaudio)
    byd__Qt5__configure__add_args(${package} -webengine-embedded-build)
    byd__Qt5__configure__add_args(${package} -system-webengine-icu)
    byd__Qt5__configure__add_args(${package} -qt-webengine-ffmpeg)
    byd__Qt5__configure__add_args(${package} -qt-webengine-opus)
    byd__Qt5__configure__add_args(${package} -qt-webengine-webp)
endif()
if(LINUX)
    byd__Qt5__configure__add_args(${package} -no-webengine-pepper-plugins)
else()
    byd__Qt5__configure__add_args(${package} -webengine-pepper-plugins)
endif()
byd__Qt5__configure__add_args(${package} -no-webengine-printing-and-pdf)
byd__Qt5__configure__add_args(${package} -webengine-proprietary-codecs)
byd__Qt5__configure__add_args(${package} -webengine-spellchecker)
if(APPLE)
    byd__Qt5__configure__add_args(${package} -webengine-native-spellchecker)
endif()
byd__Qt5__configure__add_args(${package} -webengine-webrtc)
