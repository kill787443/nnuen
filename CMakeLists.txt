cmake_minimum_required(VERSION 3.16)

project(nnuen VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

# Content of downloaded design from Figma to Qt or similar
if (EXISTS "${CMAKE_CURRENT_LIST_DIR}/importedcontent/CMakeLists.txt")
    add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/importedcontent)
endif()

qt_add_executable(appnnuen
    main.cpp
)

qt_add_qml_module(appnnuen
    URI nnuen
    QML_FILES
        Main.qml
RESOURCES shapes/LICENSE
QML_FILES shapes/geometry/offset.js shapes/graphics/matrix.js shapes/shapes/corner-rounding.js shapes/shapes/cubic.js shapes/shapes/feature-mapping.js shapes/shapes/feature.js shapes/shapes/float-mapping.js shapes/shapes/morph.js shapes/shapes/point.js shapes/shapes/polygon-measure.js shapes/shapes/rounded-corner.js shapes/shapes/rounded-polygon.js shapes/shapes/utils.js shapes/example-squircle.qml shapes/example.qml shapes/material-shapes.js shapes/ShapeCanvas.qml
RESOURCES ms.ttf
RESOURCES
QML_FILES components/NavButton.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appnnuen PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appnnuen
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appnnuen
    PRIVATE Qt6::Quick
)

install(TARGETS appnnuen
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
