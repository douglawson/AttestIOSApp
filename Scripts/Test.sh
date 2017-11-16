#!/bin/bash

xcodebuild test -project AttestIOSApp.xcodeproj -scheme AttestiOSApp -derivedDataPath ./DerivedData -destination 'platform=iOS Simulator,OS=11.1,name=iPhone X'
