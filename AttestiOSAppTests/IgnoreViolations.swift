import XCTest
import Attest

class IgnoreViolations: XCTestCase {

    /* Ignore a violation for a particular rule. */
    func testAndIgnoreSingleViolation() {

        Attest.that(storyBoardName: "AccessibilityHint", viewControllerID: "Stepper").isAccessible({(result:Attest.Result) -> () in

            for ruleResult in result.ruleResults {
                switch (ruleResult.rule.ruleId) {
                case .AccessibilityHint:
                    //We're allowing one accessibility hint violation
                    XCTAssertEqual(1, ruleResult.violations.count, ruleResult.description)
                default:
                    //Everything else must pass.
                    XCTAssertEqual(Impact.Pass.name(), ruleResult.impact.name(), ruleResult.description)
                }
            }
        })
    }
}
