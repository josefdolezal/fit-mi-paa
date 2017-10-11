build:
	xcodebuild  -project mi-paa-backpack-problem/mi-paa-backpack-problem.xcodeproj -scheme mi-paa-backpack-problem -destination 'platform=OS X,arch=x86_64' | xcpretty

test:
	xcodebuild test -project mi-paa-backpack-problem/mi-paa-backpack-problem.xcodeproj -scheme mi-paa-backpack-problem -destination 'platform=OS X,arch=x86_64' | xcpretty

clean:
	xcodebuild -project mi-paa-backpack-problem/mi-paa-backpack-problem.xcodeproj clean