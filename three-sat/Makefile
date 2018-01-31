dimacs:
	./scripts/create-dimacs.sh

fixtures: dimacs
	./scripts/generate-fixtures.sh

measure: release
	./scripts/measure.sh

clean:
	swift package clean
	rm -rf Fixtures

release:
	swift build --configuration=release
