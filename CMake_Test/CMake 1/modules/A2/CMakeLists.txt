aux_source_directory(src A2)
add_library(A2 STATIC ${A2})
target_include_directories(A2 PUBLIC include)