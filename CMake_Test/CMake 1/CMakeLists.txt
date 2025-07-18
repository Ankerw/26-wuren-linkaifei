add_executable(test main.cpp)

add_subdirectory(common)
add_subdirectory(modules)

target_link_libraries(test
    PRIVATE
    M1
    M2
    Math
)


