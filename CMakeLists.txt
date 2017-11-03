include("${CMAKE_CURRENT_LIST_DIR}/id.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/byd__Qt5__generate.cmake")



byd__Qt5__configure__use_open_source(${package})

include("${CMAKE_CURRENT_LIST_DIR}/options/dependencies.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/options/all_platform.cmake")
if(APPLE)
    include("${CMAKE_CURRENT_LIST_DIR}/options/apple.cmake")
elseif(MSVC)
    include("${CMAKE_CURRENT_LIST_DIR}/options/msvc.cmake")
elseif(UNIX)
    include("${CMAKE_CURRENT_LIST_DIR}/options/linux.cmake")
endif()



byd__Qt5__generate_configure_command(${package})
byd__Qt5__generate_build_command(${package})
byd__Qt5__generate_install_command(${package})

file(GLOB patchList
    LIST_DIRECTORIES false
    "${CMAKE_CURRENT_LIST_DIR}/patch/*.patch"
    )
byd__custom_patch(${package} patchList)

byd__EP__add(${package})





include(ExternalProject)

list(APPEND
    install_qt_conf_COMMAND
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_LIST_DIR}/qt.conf" "${CMAKE_INSTALL_PREFIX}/bin/qt.conf"
    )

if(UNIX AND NOT APPLE)
    list(APPEND
        install_qt_conf_COMMAND
        COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_LIST_DIR}/qt.conf" "${CMAKE_INSTALL_PREFIX}/libexec/qt.conf"
        )
endif()

set(arguments
    ${install_qt_conf_COMMAND}
    DEPENDEES install
    DEPENDERS create_archive
    )

byd__EP__step__log_EP_Add_Step_command(${package} create_archive "${arguments}")
ExternalProject_Add_Step(
    ${package}
    install_qt_conf
    ${arguments}
    )
