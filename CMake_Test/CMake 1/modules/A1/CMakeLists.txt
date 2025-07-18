aux_source_directory(src A1)
add_library(A1 STATIC ${A1})
target_include_directories(A1 PUBLIC include)