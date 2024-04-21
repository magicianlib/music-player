cmake_minimum_required(VERSION 3.16)

project(music-player VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

set(PLAYER_SRC
    src/Main.cpp
)

set(PLAYER_QML_FILES
    qml/App.qml

    qml/Header.qml
    qml/Content.qml
    qml/Footer.qml

    qml/RoundImage.qml
)

qt_add_executable(music-player
    ${PLAYER_SRC}
)

qt_add_qml_module(music-player
    URI music-player
    VERSION 1.0
    QML_FILES ${PLAYER_QML_FILES}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(music-player PROPERTIES
   MACOSX_BUNDLE_GUI_IDENTIFIER cn.magicianlib.music-player
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(music-player
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS music-player
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
