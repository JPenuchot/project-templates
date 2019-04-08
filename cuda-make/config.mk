# Project version
NAME    = prog
VERSION = 0.0.1

# Paths
PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

# SLURM parameters
SLURM_HOST ?= yourhost
SLURM_PATH ?= ~/.remote
SLURM_NODE ?= somenode

# CUDA arch
CUDA_GPU_ARCH ?= sm_70

# Compiler
CXX ?= clang++
CU  ?= clang++

# Compile flags
CXXFLAGS += -O3 -march=native
CXXFLAGS += -DVERSION=\"$(VERSION)\"
CXXFLAGS += -Wall -Wextra -Werror -Wnull-dereference \
            -Wdouble-promotion -Wshadow

# Language
CXXFLAGS += -std=c++17

# Includes
INCLUDES += -Iinclude -I$(CUDA_HOME)/include
CXXFLAGS += $(INCLUDES)

# CUDA flags
CUFLAGS += --cuda-gpu-arch=$(CUDA_GPU_ARCH)

# Linker
LDFLAGS += -fPIC -O3
LDFLAGS += -lm -lcudart
