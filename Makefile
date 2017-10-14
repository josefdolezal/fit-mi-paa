BENCHMARK_BIN = BackpackBenchmark
PACKAGE = backpack-problem
BIN_PATH = $(shell swift build --package-path $(PACKAGE) --show-bin-path)
EXAMPLES = $(PACKAGE)/Sources/BackpackBenchmark/Sample/*

build:
	swift build --package-path $(PACKAGE)

test:
	swift test --package-path $(PACKAGE)

clean:
	swift package --package-path $(PACKAGE) clean

# Xcode

project:
	swift package --package-path $(PACKAGE) generate-xcodeproj

code: project
	open $(PACKAGE)/*.xcodeproj

# Binaries

prepare_examples:
	cp -R $(EXAMPLES) $(BIN_PATH)

benchmark: build prepare_examples
	cd $(BIN_PATH) && ./$(BENCHMARK_BIN)
