set(package Qt5)
set(version 5.11.3)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-1
    ABI 5.11
    )

string(REGEX MATCH "[0-9]+\.[0-9]+" version_major_minor ${version})

byd__package__download_info(${package}
    URL "http://download.qt.io/archive/qt/${version_major_minor}/${version}/single/qt-everywhere-src-${version}.tar.xz"
    URL_HASH SHA256=859417642713cee2493ee3646a7fee782c9f1db39e41d7bb1322bba0c5f0ff4d
)
