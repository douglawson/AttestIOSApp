import XCTest

import Attest

import AttestiOSApp

class AccesibilityTests: XCTestCase {

    /* The most simple test. Load the initial storyboard of main. The default isAccessible() call throws an exception on failure. */
    func testSimple() {
        Attest.that(storyBoardName: "Main").isAccessible()
    }
    
    /* Run an accessiblity test that doesn't assert anything, but just logs output. */
    func testNonAsserting() {

        //Omitting viewContrllerID results in loading the initial viewcontroller for the storyboard.
        Attest.that(storyBoardName: "AccessibilityHint").isAccessible({(result:Attest.Result) -> () in

            //Make the default output more verbose
            Rule.Result.withDetails = true
            Rule.Result.withPasses = true

            print(result.description)
        })
    }

    /* Run an accessibility test that includes a custom rule implementation. */
    func testCustomRule() {

        //Add a custom rule implementation to custom rules
        Attest.customRules.append { (node:Rule.Result.Node, view:UIView) in

            let isEvil = view is UILabel

            //Add some helpful information to your rule so when it fails, people know why.
            node.checkedProps["The View is Evil"] = isEvil.description

            if view is UILabel {
                node.addCheckResult(impact: Impact.Minor, message: "We don't like static text in this application!")
            } else {
                //We could jst as easily NOT added a pass. A node with no checks is considered "inapplicable".
                node.addCheckResult(impact: Impact.Pass, message: "The view isn't a UILabel, we're good.")
            }
        }

        //Up the verbosity on these reports just a little bit.
        Rule.Result.withDetails = true

        Attest.that(storyBoardName: "AccessibilityHint").isAccessible { (result) in
            //This is obviously going to fail hard, so don't assert!
            print(result.description)
        }

        //Custom rules are static and apply to every test, so if you don't want them run in all your test cases, clear them out!
        Attest.customRules.removeAll()
    }


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

    /* Some cool hackery. Each of our demos has one accessibility issue in it. Assert that this is so! */
    func testAll() {
        for demo in Demos.values() {
            Attest.that(viewController: demo.makeViewController()).isAccessible({ (result) in
                XCTAssertEqual(1, result.violations.count, "\(demo.storyBoardName()) \(demo.viewControllerName()) \(result.description)")
            });
        }
    }
}
