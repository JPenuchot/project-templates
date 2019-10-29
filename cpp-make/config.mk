# Project version
NAME    = prog
VERSION = 0.0.1

# Paths
PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

# Compiler/Linker
CXX ?= clang++
LD  ?= clang++

CXXFLAGS += -O3 -march=native -fPIC
CXXFLAGS += -DVERSION=\"$(VERSION)\"
CXXFLAGS += -Wall -Wextra -Werror -Wnull-dereference -Wold-style-cast\
               -Wdouble-promotion -Wshadow

CXXFLAGS += -std=c++17

INCLUDES += -Iinclude
CXXFLAGS += $(INCLUDES)

LDFLAGS += -O3
LDFLAGS += -lm
