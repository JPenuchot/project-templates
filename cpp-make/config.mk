# Project version
NAME    = prog
VERSION = 0.0.1

CLANG_FORMAT_STYLE = Mozilla

# Paths
PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

# Compiler/Linker
CXX ?= clang++

CXX_FLAGS += -O3 -march=native -fPIC
CXX_FLAGS += -DVERSION=\"$(VERSION)\"
CXX_FLAGS += -Wall -Wextra -Werror -Wnull-dereference -Wold-style-cast\
               -Wdouble-promotion -Wshadow

CXX_FLAGS += -std=c++17

INCLUDES += -Iinclude
CXX_FLAGS += $(INCLUDES)

LDFLAGS += -O3
LDFLAGS += -lm
