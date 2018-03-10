set(package Qt5)
set(version 5.7.1)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-5
    ABI ${version}
    )

byd__package__download_info(${package}
    URL "https://download.qt.io/archive/qt/5.7/5.7.1/single/qt-everywhere-opensource-src-5.7.1.tar.xz"
    URL_HASH SHA1=bedd61b2767239bad01fa9ce3d1e2e63ecf721bd
)
