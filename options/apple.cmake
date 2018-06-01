
include("${CMAKE_CURRENT_LIST_DIR}/_unix.cmake")

byd__Qt5__configure__add_args(${package} -system-zlib)
byd__Qt5__configure__add_args(${package} -system-libpng)
byd__Qt5__configure__add_args(${package} -system-libjpeg)
byd__Qt5__configure__add_args(${package} -qt-doubleconversion)
byd__Qt5__configure__add_args(${package} -qt-freetype)
byd__Qt5__configure__add_args(${package} -qt-harfbuzz)
byd__Qt5__configure__add_args(${package} -openssl-linked)
byd__Qt5__configure__add_args(${package} -libproxy)
byd__Qt5__configure__add_args(${package} -qt-pcre)

byd__Qt5__configure__add_args(${package} -no-icu)

if(CMAKE_BUILD_TYPE STREQUAL Debug)
    byd__Qt5__configure__add_args(${package} -no-framework)
else()
    byd__Qt5__configure__add_args(${package} -framework)
endif()

if(CMAKE_OSX_SYSROOT)

    cmut__system__get_osx_sdk_short_name(SDKROOT_FOR_${module})
    byd__Qt5__configure__add_args(${package} -sdk ${SDKROOT_FOR_${module}})

endif()
