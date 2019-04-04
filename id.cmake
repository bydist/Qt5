set(package Qt5)
set(version 5.12.2)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-1
    ABI 5.12
    )

string(REGEX MATCH "[0-9]+\.[0-9]+" version_major_minor ${version})

byd__package__download_info(${package}
    URL "http://download.qt.io/official_releases/qt/${version_major_minor}/${version}/single/qt-everywhere-src-${version}.tar.xz"
    URL_HASH SHA256=59b8cb4e728450b21224dcaaa40eb25bafc5196b6988f2225c394c6b7f881ff5
)
