import XCTest

import Attest

import AttestiOSApp

class AccesibilityTests: XCTestCase {

    func testHints() {

        Attest.that(storyBoardName: "AccessibilityHint", viewControllerID: "Stepper").isAccessible({(result:Attest.Result) -> () in

            for ruleResult in result.ruleResults {
                switch (ruleResult.rule.ruleId) {
                case .AccessibilityHint:
                    XCTAssertEqual(1, ruleResult.violations.count, ruleResult.description)
                default:
                    XCTAssertEqual(Impact.Pass.name(), ruleResult.impact.name(), ruleResult.description)
                }
            }
        })
    }

    func testColorContrast() {
        Attest.that(storyBoardName: "ColorContrast", viewControllerID: "ColorContrast").isAccessible({(result:Attest.Result) -> () in

            for ruleResult in result.ruleResults {
                switch (ruleResult.rule.ruleId) {
                case .ColorContrast:
                    XCTAssertEqual(1, ruleResult.violations.count, ruleResult.description)
                default:
                    XCTAssertEqual(Impact.Pass.name(), ruleResult.impact.name(), ruleResult.description)
                }
            }
        })
    }

    func testAll() {
        for demo in Demos.values() {
            Attest.that(viewController: demo.makeViewController()).isAccessible({ (result) in
                XCTAssertEqual(1, result.violations.count, "\(demo.storyBoardName()) \(demo.viewControllerName()) \(result.description)")
            });
        }
    }
}
