set(package Qt5)
set(version 5.12.3)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-1
    ABI 5.12
    )

string(REGEX MATCH "[0-9]+\.[0-9]+" version_major_minor ${version})

byd__package__download_info(${package}
    URL "http://download.qt.io/official_releases/qt/${version_major_minor}/${version}/single/qt-everywhere-src-${version}.tar.xz"
    URL_HASH SHA256=6462ac74c00ff466487d8ef8d0922971aa5b1d5b33c0753308ec9d57711f5a42
)
