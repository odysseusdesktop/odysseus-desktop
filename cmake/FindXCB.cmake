# - Try to find XCB library
# Once done, this will define
#   XCB_FOUND - System has XCB
#   XCB_INCLUDE_DIRS - The XCB include directories
#   XCB_LIBRARIES - The libraries to link against
#   XCB_VERSION - The version of XCB found

# Include necessary modules
include(FindPackageHandleStandardArgs)

# Look for headers
find_path(XCB_INCLUDE_DIRS NAMES xcb/xcb.h PATH_SUFFIXES xcb)

# Look for libraries
find_library(XCB_LIBRARIES NAMES xcb)

# Check if XCB was found
if(XCB_INCLUDE_DIRS AND XCB_LIBRARIES)
    set(XCB_FOUND TRUE)
    set(XCB_VERSION "Unknown") # XCB doesn't have a version
else()
    set(XCB_FOUND FALSE)
    set(XCB_INCLUDE_DIRS "")
    set(XCB_LIBRARIES "")
endif()

# Report results
find_package_handle_standard_args(XCB DEFAULT_MSG XCB_LIBRARIES XCB_INCLUDE_DIRS)

# Provide a hint for users about how to set XCB_DIR
if(NOT XCB_FOUND)
    set(XCB_HINTS)
    if(DEFINED XCB_DIR)
        list(APPEND XCB_HINTS "XCB_DIR=${XCB_DIR}")
    else()
        list(APPEND XCB_HINTS "XCB_DIR is not set")
    endif()
    list(APPEND XCB_HINTS "CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}")
    message(STATUS "Consider setting XCB_DIR to the directory containing XCBConfig.cmake or installing XCB in a standard location.")
    message(STATUS "Hint: ${XCB_HINTS}")
endif()
