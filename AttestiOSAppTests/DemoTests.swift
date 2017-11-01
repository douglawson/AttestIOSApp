import XCTest

import Attest

import AttestiOSApp

class DemoTests: XCTestCase {


    /* Some cool hackery. Each of our demos has one accessibility issue in it. Assert that this is so! */
    func testAll() {
        for demo in Demos.values() {
            Attest.that(viewController: demo.makeViewController()).isAccessible({ (result) in
                XCTAssertEqual(1, result.violations.count, "\(demo.storyBoardName()) \(demo.viewControllerName()) \(result.description)")
            });
        }
    }
}

