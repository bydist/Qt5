


function(byd__install_qt_conf package)

    byd__package__get_install_dir(${package} install_dir)

    list(APPEND
        install_qt_conf_COMMAND
        COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_LIST_DIR}/qt.conf" "${install_dir}/bin/qt.conf"
        )


    byd__package__split_package_component_name(${package} package_name component_name)
    if(UNIX)
        if((NOT APPLE) OR (APPLE AND (CMAKE_BUILD_TYPE STREQUAL Debug)))
            if(component_name STREQUAL "qtwebengine")

                list(APPEND
                    install_qt_conf_COMMAND
                    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_LIST_DIR}/qt.conf" "${install_dir}/libexec/qt.conf"
                    )

            endif()
        endif()
    endif()



    set(arguments
        ${install_qt_conf_COMMAND}
        DEPENDEES install
        DEPENDERS create_archive
        )

    byd__EP__step__log_EP_Add_Step_command(${package} install_qt_conf "${arguments}")

    include(ExternalProject)
    ExternalProject_Add_Step(
        ${package}
        install_qt_conf
        ${arguments}
        )
endfunction()
