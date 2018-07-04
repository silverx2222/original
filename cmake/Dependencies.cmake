# Dependencies

if(MBP_TOP_LEVEL_BUILD)
    option(MBP_ANDROID_ENABLE_CCACHE "Enable use of ccache for Android" ON)

    if(MBP_ANDROID_ENABLE_CCACHE)
        find_program(CCACHE "ccache" DOC "Path to ccache binary")
        if(NOT CCACHE)
            message(FATAL_ERROR "MBP_ANDROID_ENABLE_CCACHE is enabled, but ccache was not found")
        endif()
        set(MBP_CCACHE_PATH ${CCACHE})
        unset(CCACHE)
    endif()
endif()

# Don't need dependencies for Android top-level build
if(${MBP_BUILD_TARGET} STREQUAL android)
    return()
endif()

if(${MBP_BUILD_TARGET} STREQUAL desktop)
    include(cmake/dependencies/googletest.cmake)
    include(cmake/dependencies/libarchive.cmake)
    include(cmake/dependencies/liblzma.cmake)
    include(cmake/dependencies/lz4.cmake)
    include(cmake/dependencies/minizip.cmake)
    include(cmake/dependencies/qt5.cmake)
    include(cmake/dependencies/zlib.cmake)
elseif(${MBP_BUILD_TARGET} STREQUAL android-app)
    include(cmake/dependencies/googletest.cmake)
    include(cmake/dependencies/iconv.cmake)
    include(cmake/dependencies/libarchive.cmake)
    include(cmake/dependencies/liblzma.cmake)
    include(cmake/dependencies/lz4.cmake)
    include(cmake/dependencies/minizip.cmake)
    include(cmake/dependencies/zlib.cmake)
elseif(${MBP_BUILD_TARGET} STREQUAL android-system)
    # Always use static libraries
    set(CMAKE_FIND_LIBRARY_SUFFIXES_OLD ${CMAKE_FIND_LIBRARY_SUFFIXES})
    set(CMAKE_FIND_LIBRARY_SUFFIXES .a)

    include(cmake/dependencies/android-system-core.cmake)
    include(cmake/dependencies/freetype2.cmake)
    include(cmake/dependencies/fuse.cmake)
    include(cmake/dependencies/googletest.cmake)
    include(cmake/dependencies/iconv.cmake)
    include(cmake/dependencies/libarchive.cmake)
    include(cmake/dependencies/libdrm.cmake)
    include(cmake/dependencies/liblzma.cmake)
    include(cmake/dependencies/libpng.cmake)
    include(cmake/dependencies/libsepol.cmake)
    include(cmake/dependencies/lz4.cmake)
    include(cmake/dependencies/minizip.cmake)
    include(cmake/dependencies/procps-ng.cmake)
    include(cmake/dependencies/safe-iop.cmake)
    include(cmake/dependencies/zlib.cmake)

    set(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES_OLD})
    unset(CMAKE_FIND_LIBRARY_SUFFIXES_OLD)
elseif(${MBP_BUILD_TARGET} STREQUAL hosttools)
    include(cmake/dependencies/yaml-cpp.cmake)
endif()

# Needed for every target
include(cmake/dependencies/openssl.cmake)
include(cmake/dependencies/outcome.cmake)
include(cmake/dependencies/rapidjson.cmake)
