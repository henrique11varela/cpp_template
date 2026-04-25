# COMMAND LIST
#
# clean -> removes ".o" files
# dependencies -> prints ".cpp files found"

COMPILER = g++
COMPILER_PARAMS = -Wall
OUTPUT_NAME = main
BASE_DIR = src
DEPS = $(shell find src -type f -name "*.cpp" | sed 's/\.cpp/\.o/g')

# Entrypoint
all: $(OUTPUT_NAME)

# Linker .o -> executable
$(OUTPUT_NAME): $(DEPS)
	$(COMPILER) $(DEPS) -o $(OUTPUT_NAME)

# Compiler .cpp -> .o
%.o: %.cpp
	$(COMPILER) $(COMPILER_PARAMS) -c $< -o $@

# Tools
.PHONY: clean example

# Clears project directory
clean: 
	find src -type f -name "*.o" -delete
	rm $(OUTPUT_NAME)

# Example option
dependencies:
	echo "$(DEPS)"

