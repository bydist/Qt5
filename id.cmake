set(package Qt5)
set(version 5.11.1-test)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-12
    ABI 5.11
    )

byd__package__download_info(${package}
    URL "http://download.qt.io/official_releases/qt/5.11/5.11.1/single/qt-everywhere-src-5.11.1.tar.xz"
    URL_HASH SHA1=0ac866442a960d4038a51ba3096b2cc5d796b5ee
)
