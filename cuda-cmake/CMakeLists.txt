cmake_minimum_required(VERSION 2.8.9)
project(prog)

# Adding compiler optimizations

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -march=native -Wall -Wextra -Werror")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3 -DNDEBUG")

# Adding includes

include_directories("include/")

# Adding sources

file(GLOB_RECURSE CPP_SOURCES "src/*.cpp")

file(GLOB_RECURSE CUDA_SOURCES "src/*.cu")

set_property(SOURCE CUDA_SOURCES PROPERTY COMPILE_FLAGS
  --cuda-compute-architecture=sm_70
  --cuda-path=/opt/cuda
  )

set_property(SOURCE CUDA_SOURCES PROPERTY COMPILE_FLAGS )
set_property(SOURCE CUDA_SOURCES PROPERTY LANGUAGE "CXX")

add_executable(${PROJECT_NAME} ${CPP_SOURCES} ${CUDA_SOURCES})
