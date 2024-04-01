cmake_minimum_required(VERSION 3.16)

project(odysseus-desktop VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 5.15 COMPONENTS Quick DBus REQUIRED)
find_package(KF5WindowSystem REQUIRED)

qt5_add_resources(RESOURCES qml.qrc)

add_executable(odysseus-desktop
    main.cpp backend.h backend.cpp desktopview.h desktopview.cpp ${RESOURCES}
)

set_target_properties(odysseus-desktop PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(odysseus-desktop
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(odysseus-desktop
    PRIVATE Qt5::Quick Qt5::DBus KF5::WindowSystem)

install(TARGETS odysseus-desktop
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
