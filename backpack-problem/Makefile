BENCHMARK_BIN = BackpackBenchmark
BIN_PATH = $(shell swift build --show-bin-path)
EXAMPLES = Sources/BackpackBenchmark/Sample/*

build:
	swift build

release:
	swift build --configuration release

test:
	swift test

clean:
	swift package clean

# Xcode

project:
	swift package generate-xcodeproj
	marathon run build-phase-injector.swift "BackpackProblem.xcodeproj" BackpackBenchmark --verbose

code: project
	open *.xcodeproj

# Binaries

prepare_examples:
	cp -R $(EXAMPLES) $(BIN_PATH)

benchmark: build prepare_examples
	cd $(BIN_PATH) && ./$(BENCHMARK_BIN)
