


include("${BYD_ROOT}/cmake/modules/func.cmake")
include("${BYD_ROOT}/cmake/modules/package.cmake")
include("${BYD_ROOT}/cmake/modules/private.cmake")
include("${BYD_ROOT}/cmake/modules/script.cmake")



##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

macro(__byd__Qt5__script__add_env_var)

    if(WIN32)
        set(LIBRARY_TO_LOAD_PATH bin)
        set(RUNTIME_PATH_ENV_VAR PATH)
    elseif(UNIX)
        set(LIBRARY_TO_LOAD_PATH lib)
        if(APPLE)
            set(RUNTIME_PATH_ENV_VAR DYLD_FALLBACK_LIBRARY_PATH)
        else()
            set(RUNTIME_PATH_ENV_VAR LD_LIBRARY_PATH)
        endif()
    endif()

    if(CMAKE_INSTALL_PREFIX)
        byd__script__env__prepend(${RUNTIME_PATH_ENV_VAR}:PATH "${CMAKE_INSTALL_PREFIX}/${LIBRARY_TO_LOAD_PATH}")
        byd__script__env__prepend(INCLUDE "${CMAKE_INSTALL_PREFIX}/include")
        byd__script__env__prepend(LIB "${CMAKE_INSTALL_PREFIX}/lib")
        byd__script__env__prepend(PKG_CONFIG_PATH "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")
        byd__script__env__prepend(PKG_CONFIG_PATH "${CMAKE_INSTALL_PREFIX}/share/pkgconfig")
    endif()

    if(WIN32)
        byd__package__get_source_dir(${package} source_dir)
        byd__script__env__prepend(${RUNTIME_PATH_ENV_VAR}:PATH "${source_dir}/qtbase/bin")
        byd__script__env__prepend(${RUNTIME_PATH_ENV_VAR}:PATH "${source_dir}/gnuwin32/bin")
    endif()

endmacro()


function(__byd__Qt5__get_platform_compiler result)
    if(APPLE)
        if(CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
            set(mkspec macx-clang)
        elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
            set(mkspec macx-clang-llvm6.0.0)
        elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set(mkspec macx-g++)
        endif()
    elseif(UNIX)
        if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
            set(mkspec linux-clang)
            if(CMAKE_CXX_FLAGS MATCHES ".*-stdlib=libc\\+\\+.*")
                set(mkspec ${mkspec}-libc++)
            endif()
        elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            if(CMAKE_SIZEOF_VOID_P EQUAL 8)
                set(mkspec linux-g++-64)
            else()
                set(mkspec linux-g++-32)
            endif()
        endif()
    elseif(WIN32)
        if(MSVC_VERSION EQUAL 1800)
            set(mkspec win32-msvc2013)
        elseif(MSVC_VERSION EQUAL 1900)
            if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
                set(mkspec win32-clang-msvc2015)
            else()
                set(mkspec win32-msvc2015)
            endif()
        elseif((MSVC_VERSION GREATER_EQUAL 1910) AND (MSVC_VERSION LESS_EQUAL 1919))
            if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
                set(mkspec win32-clang-msvc2017)
            else()
                set(mkspec win32-msvc2017)
            endif()
        else()
            cmut_fatal("[byd][Qt5] - msvc toolset version \"${MSVC_TOOLSET_VERSION}\" not supported by byd. patch me if you can!")
        endif()
    endif()

    byd__func__return(mkspec)

endfunction()


##--------------------------------------------------------------------------------------------------------------------##

function(byd__Qt5__configure__add_args package)

    byd__func__add_to_property(BYD__QT5__CONFIGURE__ARGS__${package} ${ARGN})

endfunction()

##--------------------------------------------------------------------------------------------------------------------##

function(byd__Qt5__configure__get_args package result)

    byd__func__get_property(BYD__QT5__CONFIGURE__ARGS__${package} __result)
    byd__func__return(__result)

endfunction()

##--------------------------------------------------------------------------------------------------------------------##

function(byd__Qt5__configure__add_arg_if_dependency_is_added package dependency)

    set(dependency_byd_name "${dependency}")
    if(NOT "x${ARGN}" STREQUAL "x")
        set(dependency_byd_name "${ARGN}")
    endif()
    byd__package__is_added(${dependency_byd_name} is_added)
    if(is_added)
        byd__Qt5__configure__add_args(${package} -${dependency})
    else()
        byd__Qt5__configure__add_args(${package} -no-${dependency})
    endif()

endfunction()

##--------------------------------------------------------------------------------------------------------------------##

function(byd__Qt5__configure__use_open_source package)
    byd__Qt5__configure__add_args(${package} -opensource -confirm-license)
endfunction()

##--------------------------------------------------------------------------------------------------------------------##

function(byd__Qt5__configure__add_arg_system_or_qt package dependency)

    set(dependency_byd_name "${dependency}")
    if(NOT "x${ARGN}" STREQUAL "x")
        set(dependency_byd_name "${ARGN}")
    endif()
    byd__package__is_added(${dependency_byd_name} is_added)
    if(is_added)
        byd__Qt5__configure__add_args(${package} -system-${dependency})
    else()
        byd__Qt5__configure__add_args(${package} -qt-${dependency})
    endif()
endfunction()

##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

function(byd__Qt5__generate_configure_command package)

    set(__property_name BYD__EP__CONFIGURE__CONFIGURE_COMMAND__${package})
    byd__private__error_if_property_is_defined(${__property_name})

    byd__package__get_script_dir(${package} script_dir)
    byd__package__get_source_dir(${package} source_dir)
    byd__package__get_install_dir(${package} install_dir)


    set(configure_arg)
    if(install_dir)
        list(APPEND configure_arg "-prefix" "${install_dir}")
    endif()


    if(CMAKE_BUILD_TYPE STREQUAL Debug)
        list(APPEND configure_arg "-debug" "-no-optimized-tools")
        if(APPLE)
            list(APPEND configure_arg "-no-framework")
        endif()
    elseif(CMAKE_BUILD_TYPE STREQUAL RelWithDebInfo)
        list(APPEND configure_arg "-release" "-force-debug-info" "-separate-debug-info")
    else()
        list(APPEND configure_arg "-release")
    endif()


    if(BYD__OPTION__USE_CCACHE)
        list(APPEND configure_arg "-ccache")
    endif()


    if(CMAKE_VERBOSE_MAKEFILE)
        byd__Qt5__configure__add_args(${package} -verbose)
    else()
        if(NOT WIN32)
            byd__Qt5__configure__add_args(${package} -silent)
        endif()
    endif()

    if(CMAKE_CXX_STANDARD AND (NOT MSVC))
        if(CMAKE_CXX_STANDARD EQUAL 17)
            set(CXXSTD 1z)
        else()
            set(CXXSTD ${CMAKE_CXX_STANDARD})
        endif()
        byd__Qt5__configure__add_args(${package} -c++std c++${CXXSTD})
    endif()



    __byd__Qt5__get_platform_compiler(platform_compiler)
    list(APPEND configure_arg "-platform" "${platform_compiler}")

    if(BUILD_SHARED_LIBS)
        byd__Qt5__configure__add_args(${package} -shared)
    else()
        byd__Qt5__configure__add_args(${package} -static)
    endif()
    list(APPEND configure_arg "-nomake" "examples")


    set(configure_cmd "${source_dir}/configure")
    if(WIN32)
        set(configure_cmd "${configure_cmd}.bat")
    endif()

    byd__Qt5__configure__get_args(${package} custom_configure_args)
    set(command "${configure_cmd}" "${configure_arg}" "${custom_configure_args}")


    byd__script__begin("${script_dir}/configure.cmake")
        __byd__Qt5__script__add_env_var()
        byd__script__command("${command}")
    byd__script__end()


    byd__build_system__default_configure_command(${package})

endfunction()

##--------------------------------------------------------------------------------------------------------------------##

function(byd__Qt5__generate_build_command package)

    set(__property_name BYD__EP__BUILD__BUILD_COMMAND__${package})
    byd__private__error_if_property_is_defined(${__property_name})

    byd__package__get_script_dir(${package} script_dir)


    byd__private__get_num_core_available(num_core)
    if(UNIX)
        byd__private__get_num_core_available(num_core)
        set(command make -j${num_core})
    elseif(WIN32 AND MSVC)
        set(command jom)
    endif()

    byd__script__begin("${script_dir}/build.cmake")
        __byd__Qt5__script__add_env_var()
        byd__script__env__set(NINJAFLAGS "-j${num_core}")
        if(WIN32 AND MSVC)
            # since Qt 5.11.1, to build QtWebEngine, we got error:
            # "ninja: error: manifest 'build.ninja' still dirty after 100 tries"
            # when build gn, so restart build script many time to end it correctly
            byd__script__try_command("${command}")
            byd__script__try_command("${command}")
            byd__script__command("${command}")
        else()
            byd__script__command("${command}")
        endif()
    byd__script__end()


    byd__build_system__default_build_command(${package})

endfunction()

##--------------------------------------------------------------------------------------------------------------------##

function(byd__Qt5__generate_install_command package)

    set(__property_name BYD__EP__INSTALL__INSTALL_COMMAND__${package})
    byd__private__error_if_property_is_defined(${__property_name})

    byd__package__get_script_dir(${package} script_dir)



    if(UNIX)
        byd__private__get_num_core_available(num_core)
        set(command make install -j${num_core})
    elseif(WIN32 AND MSVC)
        set(command nmake install)
    endif()


    byd__script__begin("${script_dir}/install.cmake")
        __byd__Qt5__script__add_env_var()
        byd__script__command("${command}")
    byd__script__end()


    byd__build_system__default_install_command(${package})

endfunction()

##--------------------------------------------------------------------------------------------------------------------##

function(byd__Qt5__generate_test_command package)

    set(__property_name BYD__EP__TEST__TEST_COMMAND__${package})
    byd__private__error_if_property_is_defined(${__property_name})

    byd__package__get_script_dir(${package} script_dir)



    if(UNIX)
        set(command make test)
    elseif(WIN32 AND MSVC)
        set(command nmake test)
    endif()



    byd__script__begin("${script_dir}/test.cmake")
        __byd__Qt5__script__add_env_var()
        byd__script__command("${command}")
    byd__script__end()


    byd__build_system__default_test_command(${package})

endfunction()

##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##


function(byd__Qt5__get_component_inter_dependencies component result)

    if(WIN32)
        set(ACTIVE_QT qtactiveqt)
    endif()
    if(ANDROID)
        set(ANDROID_EXTRAS qtandroidextras)
    endif()


    set(qtbase_deps)

    set(qtandroidextras_deps qtbase)
    set(qtmacextras_deps     qtbase)
    set(qtx11extras_deps     qtbase)
    set(qtsvg_deps           qtbase)
    set(qtxmlpatterns_deps   qtbase)
    set(${ACTIVE_QT}_deps    qtbase)
    set(qtimageformats_deps  qtbase)
    set(qtserialport_deps    qtbase)

    set(qtdeclarative_deps qtbase qtsvg qtxmlpatterns)

    set(qtcanvas3d_deps         qtdeclarative qtbase qtsvg qtxmlpatterns)
    set(qtdoc_deps              qtdeclarative qtbase qtsvg qtxmlpatterns)
    set(qtgraphicaleffects_deps qtdeclarative qtbase qtsvg qtxmlpatterns)
    set(qtmultimedia_deps       qtbase qtdeclarative qtsvg qtxmlpatterns)
    set(qtsensors_deps          qtbase qtdeclarative qtsvg qtxmlpatterns)
    set(qtwayland_deps          qtbase qtdeclarative qtsvg qtxmlpatterns)
    set(qtwebsockets_deps       qtbase qtdeclarative qtsvg qtxmlpatterns)

    set(qtquickcontrols_deps qtdeclarative qtgraphicaleffects qtbase qtsvg qtxmlpatterns)
    set(qtwinextras_deps     qtbase qtdeclarative qtmultimedia qtsvg qtxmlpatterns)
    set(qtconnectivity_deps  qtbase ${ANDROID_EXTRAS} qtdeclarative qtsvg qtxmlpatterns)
    set(qtwebchannel_deps    qtbase qtdeclarative qtwebsockets qtsvg qtxmlpatterns)
    set(qt3d_deps            qtdeclarative qtimageformats qtbase qtsvg qtxmlpatterns)

    set(qtlocation_deps       qtbase qtdeclarative qtquickcontrols qtgraphicaleffects qtsvg qtxmlpatterns)
    set(qtquickcontrols2_deps qtquickcontrols qtbase qtdeclarative qtgraphicaleffects qtsvg qtxmlpatterns)

    set(qttools_deps     qtbase qtdeclarative ${ACTIVE_QT} qtsvg qtxmlpatterns)
    set(qtwebengine_deps qtquickcontrols qtwebchannel qtlocation qtdeclarative qtgraphicaleffects qtbase qtsvg qtxmlpatterns qtwebsockets)

    set(qtwebview_deps      qtdeclarative qtwebengine qtquickcontrols qtwebchannel qtlocation qtgraphicaleffects qtbase qtsvg qtxmlpatterns qtwebsockets)
    set(qtscript_deps       qtbase qttools qtbase qtdeclarative ${ACTIVE_QT} qtsvg qtxmlpatterns)
    set(qttranslations_deps qttools qtbase qtdeclarative ${ACTIVE_QT} qtsvg qtxmlpatterns)

    set(qtcharts_deps          qtbase)
    set(qtdatavis3d_deps       qtbase)
    set(qtgamepad_deps         qtbase)
    set(qtpurchasing_deps      qtbase)
    set(qtscxml_deps           qtbase)
    set(qtserialbus_deps       qtserialport qtbase)
    set(qtvirtualkeyboard_deps qtbase)


    byd__func__return(${component}_deps)

endfunction()
