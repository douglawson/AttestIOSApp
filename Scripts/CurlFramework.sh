#!/bin/bash

#Change this to the version of the framework you want.
FRAMEWORK_VERSION=1.1.0_rc2

#This has to match up with Fraqmework Search paths in XCode Build Configuration.
FRAMEWORK_DIR=./Framework/Release

#Ensure it exists and change to it.
rm -rf ./Framework
mkdir -p $FRAMEWORK_DIR
pushd $FRAMEWORK_DIR

#Fetch the library zip with our anonymous api key.
curl -H "X-JFrog-Art-Api: AKCp5Z3qFNjBcw3yvfWA7rcmT7Yf4wcR1FTE5P5VBubBfd7TrURFKJvBQiPcUFAAUvEgavrLg" \
	-O "https://agora.dequecloud.com/artifactory/Attest-iOS/com/deque/woldspace/attest-ios-framework/$FRAMEWORK_VERSION/Attest.framework-$FRAMEWORK_VERSION.zip"

#Unzip whatever version was fetched
unzip Attest.*zip