cmake_minimum_required(VERSION 3.0) 

# set the project name 
project(Study VERSION 0.9) 

set(CMAKE_CXX_STANDARD 11) 
set(CMAKE_CXX_STANDARD_REQUIRED True) 

# add the executable
#set(${PROJECT_SOURCE_DIR}/tests/log_test/*.cpp log_test_src)
aux_source_directory(${PROJECT_SOURCE_DIR}/tests/log_test/ log_test_src)
add_executable(log_test ${log_test_src})

target_include_directories(
log_test
PUBLIC
"${PROJECT_SOURCE_DIR}/"
)