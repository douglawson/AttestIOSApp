import XCTest

import Attest
@testable import AttestiOSApp

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

        Attest.that(storyBoardName: "AccessibilityHint", viewControllerID: "SegmentedControl").isAccessible({(result:Attest.Result) -> () in

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
        Attest.that(storyBoardName: "ColorContrast", viewControllerID: "AlphaBackground").isAccessible({(result:Attest.Result) -> () in

            for ruleResult in result.ruleResults {
                switch (ruleResult.rule.ruleId) {
                case .ColorContrast:
                    XCTAssertEqual(1, ruleResult.violations.count, ruleResult.description)
                default:
                    XCTAssertEqual(Impact.Pass.name(), ruleResult.impact.name(), ruleResult.description)
                }
            }
        })

        Attest.that(storyBoardName: "ColorContrast", viewControllerID: "AlphaBackground").isAccessible({(result:Attest.Result) -> () in

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
//                for ruleResult in result.ruleResults {
//                    if (demo.storyBoardName() == ruleResult.rule.ruleId.name()) {
//                        XCTAssertEqual(1, ruleResult.violations.count, ruleResult.description)
//                    } else {
//                        XCTAssertEqual(Impact.Pass.name(), ruleResult.impact.name(), ruleResult.description)
//                    }
//                }

                XCTAssertEqual(1, result.violations.count, "\(demo.storyBoardName()) \(demo.viewControllerName()) \(result.description)")
            });
        }
    }
}
