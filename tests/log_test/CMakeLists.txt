cmake_minimum_required(VERSION 3.0)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
# set the project name
project(log_test_pj)

message(STATUS "*****************${PROJECT_ROOT_DIR}")
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/ current-src)
aux_source_directory(${PROJECT_ROOT_DIR}/utils utils-src)

add_executable(log_test ${current-src} ${utils-src})
target_include_directories(
log_test
PUBLIC
${STUDY_INCLUDE}
)
##  target_link_libraries(log_test THIRD_PARTY_LIB)