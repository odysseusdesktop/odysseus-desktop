cmake_minimum_required(VERSION 3.16)

project(odysseus-desktop VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick DBus REQUIRED)

qt_add_executable(odysseus-desktop
    main.cpp backend.h backend.cpp
)

qt_add_qml_module(odysseus-desktop
    URI odysseusdesktop
    VERSION 1.0
    QML_FILES main.qml
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
    PRIVATE Qt6::Quick Qt6::DBus)

install(TARGETS odysseus-desktop
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
