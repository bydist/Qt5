
include("${CMAKE_CURRENT_LIST_DIR}/byd__Qt5__generate.cmake")


function(build package)

    byd__package__check_component(${package})


    byd__package__split_package_component_name(${package} package_name component_name)

    byd__Qt5__get_component_inter_dependencies(${component_name} dependencies)
    set(components_to_keep ${component_name} ${dependencies})

    byd__package__get_components(${package_name} components)
    foreach(component IN LISTS components_to_keep)
        list(REMOVE_ITEM components ${component})
    endforeach()

    foreach(component IN LISTS components)
        byd__Qt5__configure__add_args(${package} -skip ${component})
    endforeach()

    include("${CMAKE_CURRENT_LIST_DIR}/per_component_CMakeLists.txt")

endfunction()



build(${package})
