.POSIX:

include config.mk

# Sources
CXX_FILES = $(shell find src -name "*.cpp")
HPP_FILES = $(shell find . -name "*.hpp")

# Objects
CXX_OBJ = $(CXX_FILES:.cpp=.o)
OBJ = $(CXX_OBJ)

# Dependency files
DEP = $(OBJ:.o=.d)

all: $(NAME)

# Compilation
%.o: %.cpp
	$(CXX) $(CXX_FLAGS) -MT $@ -MF $*.d -MMD -o $@ -c $<

# Linking
$(NAME): $(OBJ)
	$(CXX) -o $@ $(OBJ) $(LDFLAGS)

# Dependencies
-include $(DEP)

debug: CXX_FLAGS += -DDEBUG -g
debug: $(NAME)

clean:
	rm -f $(NAME) $(NAME).asm $(OBJ) $(DEP)

run: $(NAME)
	./$(NAME)

format:
	clang-format -i --style=$(CLANG_FORMAT_STYLE) $(CXX_FILES) $(HPP_FILES)

.PHONY: all clean echo
