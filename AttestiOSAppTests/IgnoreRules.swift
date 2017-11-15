import XCTest
import Attest

class IgnoreRules: XCTestCase {

    //Set up a list of Rule IDs to ignore.
    static var ignoredRuleIDs: [RuleID] = [
        RuleID.ColorContrast,
        RuleID.AccessibilityHint
    ];

    //Set up a static function that utilizes the list of ignored IDs
    static func resultConsumer(attestResult: Attest.Result) {
        for ruleResult in attestResult.ruleResults {
            if (!ignoredRuleIDs.contains(ruleResult.rule.ruleId)) {
                XCTAssertEqual(Impact.Pass.name(), ruleResult.impact.name(), ruleResult.description)
            }
        }
    }

    //Testing using the above function as the result consumer.
    func testSuccessfullyIgnoringRules() {
        Attest.that(storyBoardName:"ColorContrast", viewControllerID:"BlendedBackground").isAccessible(IgnoreRules.resultConsumer)
        Attest.that(storyBoardName:"AccessibilityHint").isAccessible(IgnoreRules.resultConsumer)
    }
}

