#!/bin/sh
set -e

PLATFORM="platform=iOS Simulator,OS=10.2,name=iPhone 7"
WORKSPACE="TOZ_iOS.xcworkspace"
SCHEME="TOZ_iOS"

xcodebuild \
    -workspace "$WORKSPACE" \
    -scheme "$SCHEME" \
	-destination "$PLATFORM" \
    -hideShellScriptEnvironment \
	test \
	| xcpretty