cmake_minimum_required(VERSION 3.16)

project(BaseLayout VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Qt6 COMPONENTS Quick Gui Qml
    QuickControls2 Network Widgets PrintSupport REQUIRED)

add_subdirectory(3rdparty/FluentUI)

qt_standard_project_setup(REQUIRES 6)

qt_add_executable(appBaseLayout
    main.cpp
)


# 1. 设置 Qt 策略，消除 QTP0004 警告
qt_policy(SET QTP0004 NEW)

# 2. 自动搜索 Layout 文件夹下的所有 QML 文件
file(GLOB_RECURSE ALL_LAYOUT_FILES_ABS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "qml/*/*.qml")

# 3. 批量处理文件属性（确保逻辑路径展平到根部）
foreach(rel_file ${ALL_LAYOUT_FILES_ABS})
    # 获取纯文件名，例如 SearchLayoutTemplate.qml
    get_filename_component(filename ${rel_file} NAME)

    # 将该文件的资源别名设置为纯文件名，实现“方式B”的展平效果
    set_source_files_properties(${rel_file}
        PROPERTIES
            QT_QML_SOURCE_RESOURCE_PATH "${filename}"
            QT_RESOURCE_ALIAS "${filename}" # 解决你报错中的绝对路径/别名要求
    )
endforeach()

qt_add_qml_module(appBaseLayout
    URI BaseLayout
    VERSION 1.0
    QML_FILES
        Main.qml
        ${ALL_LAYOUT_FILES_ABS}
        QML_FILES qml/View/ViewUserInfo/RegionUserInfoBody.qml
        QML_FILES qml/View/ViewUserInfo/RegionUserInfoFooter.qml
)


# 1. 定义开关：Debug模式默认开启 DEV_MODE
if(CMAKE_BUILD_TYPE MATCHES "Debug")
    option(DEV_MODE "Enable direct file loading for hot reloading" ON)
else()
    option(DEV_MODE "Enable direct file loading for hot reloading" OFF)
endif()

# 2. 如果开启了 DEV_MODE，注入绝对路径宏
if(DEV_MODE)
    # 获取 Main.qml 的绝对路径
    # 注意：这里假设 Main.qml 和 CMakeLists.txt 在同一级目录
    # 如果在 qml/ 子目录下，请改为 "${CMAKE_CURRENT_SOURCE_DIR}/qml/Main.qml"
    set(QML_SRC_ABSOLUTE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/Main.qml")

    # 将路径注入到 target 中
    target_compile_definitions(appBaseLayout PRIVATE
        LOAD_FROM_LOCAL
        QML_LOCAL_PATH="${QML_SRC_ABSOLUTE_PATH}"
    )
    message(STATUS "🛠️  [开发模式] 已启用热加载，路径: ${QML_SRC_ABSOLUTE_PATH}")
else()
    message(STATUS "🚀 [发布模式] 使用资源系统加载")
endif()
# ==============================================================



# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appBaseLayout PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appBaseLayout
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appBaseLayout
    PRIVATE
    Qt6::Quick
    Qt6::Gui
    Qt6::Qml
    Qt6::QuickControls2
    Qt6::Network
    Qt6::Widgets
    Qt6::PrintSupport
    fluentuiplugin
)

include(GNUInstallDirs)
install(TARGETS appBaseLayout
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
