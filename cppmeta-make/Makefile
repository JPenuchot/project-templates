.POSIX:
.SUFFIXES: .cpp .hpp .h .o .d .asm

include config.mk

# Sources
CXXSRC = $(shell find src -name "*.cpp")

# Objects
CXXOBJ = $(CXXSRC:.cpp=.o)
OBJ    = $(CXXOBJ)

# Dependency files
DEP   = $(OBJ:.o=.d)

all: $(NAME)

# Compilation
.cpp.o:
	$(CPPMETA_HOME)/bin/clang++ $(CXXFLAGS) -MMD -c -o $@ $<

# Linking
$(NAME): $(OBJ)
	$(CPPMETA_HOME)/bin/clang++ -o $@ $(OBJ) $(LDFLAGS)

# Dependencies
-include $(DEP)

debug: CXXFLAGS += -DDEBUG -g
debug: $(NAME)

clean:
	rm -f $(NAME) $(NAME).asm $(OBJ) $(DEP)

run: $(NAME)
	./$(NAME)

dump: $(NAME)
	objdump -dC $(NAME) > $(NAME).asm

.PHONY: all clean echo
