cmake_minimum_required(VERSION 3.10)
project(proj)

file(GLOB_RECURSE SOURCES "src/*.cpp")
file(GLOB_RECURSE HEADERS "src/*.hpp" "include/*.hpp")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(prog ${SOURCES})
target_include_directories(prog PUBLIC "include/")

add_custom_target(format COMMAND "clang-format" "-i" "--style=Mozilla"
  ${SOURCES} ${HEADERS})
