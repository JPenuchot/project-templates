# Project version
NAME    = prog
VERSION = 0.0.1

# Paths
PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

# Linker
LD  = $(JITHOME)/bin/clang++
CXX = $(JITHOME)/bin/clang++

CXXFLAGS += -O3 -fPIC -fjit -march=corei7
CXXFLAGS += -DVERSION=\"$(VERSION)\"
#CXXFLAGS += -Wall -Wextra -Werror -Wnull-dereference -Wold-style-cast \
#               -Wdouble-promotion -Wshadow

CXXFLAGS += -std=c++2a

INCLUDES += -Iinclude
CXXFLAGS += $(INCLUDES)

LDFLAGS += -O3 -fjit -L$(JITHOME)/lib
LDFLAGS += -lm
