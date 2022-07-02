add_library(libfoo)
# CMake prepends "lib" to library name, so it would be "liblibfoo" if we didn't do this.
set_target_properties(libfoo PROPERTIES OUTPUT_NAME "foo")

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

target_sources(libfoo
    PRIVATE
        AbstractApplication.cpp
        AbstractApplication.h
        FooGlobal.h
)

find_package(Qt6 REQUIRED COMPONENTS Core)

target_link_libraries(libfoo
    PUBLIC
        Qt6::Core
)

target_include_directories(libfoo
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(libfoo
    PRIVATE
        FOO_LIBRARY
)
