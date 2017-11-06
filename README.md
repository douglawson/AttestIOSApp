# Attest for iOS Mobile Application
The integration test suite for the Attest for iOS product. Also serves as examples and documentation
of best practices on how to use the Attest for iOS Automated Accessibility Scanning Library. The application
itself is a very simple series of ViewControllers that aim to demo one aspect of accessibility api usage.
Within each example is a demo of how to misuse iOS APIs and how to use them properly.

Attest for iOS Libarry 1.0 Branch: [![1.0 CirclCI](https://circleci.com/gh/dequelabs/AttestIOS/tree/1.0.svg?style=shield&circle-token=317c78a2f327205f252a20d18e71b84516e2c912)](https://circleci.com/gh/dequelabs/AttestIOS/tree/1.0)

Build Status for this Repository: [![CircleCI](https://circleci.com/gh/dequelabs/AttestIOSApp/tree/master.svg?style=shield&circle-token=43cf7b8bde9c08b12f88f9282983a3837bcd6522)](https://circleci.com/gh/dequelabs/AttestIOSApp/tree/master)

## Building with Attest for iOS

Attest for iOS is a Swift framework. Most of the features are also designed to work in Objective C. Link to it like you would any other framework.

## Unit Testing Examples

Unit testing with the Attest for iOS Framework is easy! Check out the examples below.

[A simple Accessibility Test](https://github.com/dequelabs/AttestIOSApp/blob/master/AttestiOSAppTests/SimpleTest.swift)

[Ignore Specific Violations](https://github.com/dequelabs/AttestIOSApp/blob/master/AttestiOSAppTests/IgnoreViolations.swift)

[Custom Rules](https://github.com/dequelabs/AttestIOSApp/blob/master/AttestiOSAppTests/CustomRules.swift)

## UI Testing Examples

Coming soon!

## Test Using the Desktop Client
[Starting the Attest Server](https://github.com/dequelabs/AttestIOSApp/blob/master/AttestiOSApp/AppDelegate.swift)

[Syncing Results with the Attest Desktop Client](https://dequeuniversity.com/guide/attest-mobile/1.0/using/manual-testing/desktop/analyzing/)

## Known Issues

### Accessibility Inspector On
When testing on the simulator, if you don't attach the Accessibility Inspector to the simulated device, the AT layer may not initialize. Our rules are designed in such a way, where this won't cause false positives, but it will cause fewer reports than expected. 

XCode -> Open Developer Tool -> Accessibility Inspector

Attach it to your simulator.

### Menu Bar False Positives

Some rules, in particular color contrast, can report false positives on Menu Bar elements.

## Disclaimer
All Rights Reserved
