aux_source_directory(src Math_src)
add_library(Math STATIC ${Math_src})
include_directories(CMAKE_CURRENT_SOURCE_DIR/include)
target_include_directories(Math PUBLIC include ${kalman_INCLUDE_DIRS})
