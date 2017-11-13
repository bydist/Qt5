
include("${CMAKE_CURRENT_LIST_DIR}/byd__Qt5__generate.cmake")


function(build package)

    cmut_info("[byd][Qt5] = build( ${package} )")

    byd__package__split_package_component_name(${package} package_name component_name)
    byd__private__is_empty("${component_name}" is_component_name_empty)


    if(is_component_name_empty)
        cmut_info("[byd] - [Qt5] : no component to build.")
        return()
    endif()

    byd__package__get_components(${package_name} components)
    if(NOT component_name IN_LIST components)
        cmut_fatal("[byd][Qt5] - [${package}] : component \"${component_name}\" requested but not provide by package definition.")
    endif()


    byd__Qt5__get_component_inter_dependencies(${component_name} dependencies)
    set(components_to_keep ${component_name} ${dependencies})

    foreach(component IN LISTS components_to_keep)
        list(REMOVE_ITEM components ${component})
    endforeach()

    foreach(component IN LISTS components)
        byd__Qt5__configure__add_args(${package} -skip ${component})
    endforeach()

    include("${CMAKE_CURRENT_LIST_DIR}/per_component_CMakeLists.txt")

endfunction()



build(${package})
