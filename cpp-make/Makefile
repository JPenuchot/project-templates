.POSIX:
.SUFFIXES: .cpp .hpp .h .o .d .asm

include config.mk

# Sources
CPP_FILES = $(shell find src -name "*.cpp")
HPP_FILES = $(shell find . -name "*.hpp")

# Objects
CXXOBJ = $(CPP_FILES:.cpp=.o)
OBJ    = $(CXXOBJ)

# Dependency files
DEP   = $(OBJ:.o=.d)

all: $(NAME)

# Compilation
.cpp.o:
	$(CXX) $(CXXFLAGS) -MT $@ -MF $(subst .cpp,.d,$<) -MMD -o $@ -c $<

# Linking
$(NAME): $(OBJ)
	$(CXX) -o $@ $(OBJ) $(LDFLAGS)

# Dependencies
-include $(DEP)

debug: CXXFLAGS += -DDEBUG -g
debug: $(NAME)

clean:
	rm -f $(NAME) $(NAME).asm $(OBJ) $(DEP)

run: $(NAME)
	./$(NAME)

format:
	clang-format -i --style=$(CLANG_FORMAT_STYLE) $(CPP_FILES) $(HPP_FILES)

dump: $(NAME)
	objdump -dC $(NAME) > $(NAME).asm

.PHONY: all clean echo
