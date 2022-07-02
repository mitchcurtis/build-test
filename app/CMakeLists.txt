add_executable(app)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

target_sources(app
    PRIVATE
        main.cpp
        Application.cpp
        Application.h
)

target_compile_definitions(app
    PRIVATE
        APP_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}"
)

find_package(Qt6 REQUIRED COMPONENTS Core)

target_include_directories (app
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/libfoo
)

target_link_libraries(app
    PRIVATE
        libfoo
        Qt6::Core
)

set_target_properties(app
    PROPERTIES
    CXX_EXTENSIONS FALSE
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED TRUE
)
