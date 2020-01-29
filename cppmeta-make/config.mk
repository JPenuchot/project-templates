# Project version
NAME    = prog
VERSION = 0.0.1

# Paths
PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

# Linker
LD = $(CPPX)

CXXFLAGS += -O3 -march=native -fPIC
CXXFLAGS += -DVERSION=\"$(VERSION)\"
#CXXFLAGS += -Wall -Wextra -Werror -Wnull-dereference -Wold-style-cast \
#               -Wdouble-promotion -Wshadow

CXXFLAGS += -std=c++2a -freflection

INCLUDES += -Iinclude
CXXFLAGS += $(INCLUDES)

LDFLAGS += -O3
LDFLAGS += -lm
