# Project version
NAME    = prog
VERSION = 0.0.1

# Paths
PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

# Compilers
CXX ?= clang++

CXXFLAGS += -O3 -march=native
CXXFLAGS += -DVERSION=\"$(VERSION)\"
CXXFLAGS += -Wall -Wextra -Werror -Wnull-dereference -Wold-style-cast\
            -Wdouble-promotion -Wshadow

CXXFLAGS += -std=c++17

INCLUDES += -Iinclude
CXXFLAGS += $(INCLUDES)

LDFLAGS += -fPIC -O3
LDFLAGS += -lm -lhpx_iostreams

# HPX flags
HPXFLAGS += $(shell pkg-config --libs --cflags hpx_application)
