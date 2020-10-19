cmake_minimum_required(VERSION 3.10)
project(prog)

# Adding compiler optimizations

file(GLOB_RECURSE SOURCES "src/*.cpp")

add_executable(prog ${SOURCES})

# Adding includes

target_include_directories(prog PUBLIC "include/")
