cmake_minimum_required(VERSION 3.16)

project(VehicleUI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

find_package(Qt6 REQUIRED COMPONENTS Location)
# target_link_libraries(appVehicleUI PRIVATE Qt6::Location)

qt_standard_project_setup()

qt_add_executable(appVehicleUI
    main.cpp
)

qt_add_qml_module(appVehicleUI
    URI VehicleUI
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES Resources/qml.qrc
        QML_FILES ui/BottomBar/BottomBar.qml
        QML_FILES ui/RightScreen/RightScreen.qml
        QML_FILES ui/LeftScreen/LeftScreen.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appVehicleUI PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appVehicleUI
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appVehicleUI
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appVehicleUI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
