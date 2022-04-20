cmake_minimum_required(VERSION 3.0)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
# set the project name
project(Study)

option(ENABLE_DEBUG "debug mode" OFF)
if (ENABLE_DEBUG)
elseif()
endif()

set(CMAKE_CXX_FLAGS_DEBUG "-g -O0 -fPic -Werror")
set(CMAKE_CXX_FLAGS_RELeASE "-O3 -Wall -fPIC -Werror")

set(PROJECT_ROOT_DIR ${PROJECT_SOURCE_DIR}/ CACHE PATH "root dir" FORCE)
## include
set(STUDY_INCLUDE ${PROJECT_SOURCE_DIR}/)
list(APPEND STUDY_INCLUDE ${PROJECT_SOURCE_DIR}/utils)

## link lib
set(THIRD_PARTY_LIB pthread)
set(THIRD_PARTY_LIB_DIR ${PROJECT_SOURCE_DIR}/3rdparty)
link_directories(${THIRD_PARTY_LIB_DIR})

add_subdirectory(${PROJECT_SOURCE_DIR}/tests/log_test)

# add the executable
##  set(${PROJECT_SOURCE_DIR}/tests/log_test/*.cpp log_test_src)
##  aux_source_directory(${PROJECT_SOURCE_DIR}/tests/log_test/ log_test_src)
##  add_executable(log_test ${log_test_src})
##  target_include_directories(
##  log_test
##  PUBLIC
##  "${PROJECT_SOURCE_DIR}/"
##  )