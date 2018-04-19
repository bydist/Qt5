
include("${CMAKE_CURRENT_LIST_DIR}/byd__Qt5__generate.cmake")


function(build package)

    if(APPLE AND ( NOT CMAKE_COMPILER_ID STREQUAL AppleClang) )
        cmut_fatal("[byd][${package}] - Qt have to be build with Apple Clang on Apple. QtWebEngine segfault with another compiler.")
    endif()

    byd__package__check_component(${package})


    byd__package__split_package_component_name(${package} package_name component_name)

    if("${component_name}" STREQUAL "qtbase")
        include("${CMAKE_CURRENT_LIST_DIR}/per_component_CMakeLists.txt")
	else()
		include("${CMAKE_CURRENT_LIST_DIR}/dummy_CMakeLists.txt")
    endif()


endfunction()



build(${package})
