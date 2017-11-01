import XCTest

import Attest

import AttestiOSApp

class AccesibilityTests: XCTestCase {

    /* The most simple test. Load the initial storyboard of main. The default isAccessible() call throws an exception on failure. */
    func testSimple() {

        //Defaults to false
        Rule.Result.withDetails = true

        //Defaults to false
        Rule.Result.withPasses = false

        Attest.that(storyBoardName: "Main").isAccessible()
    }
    
    /* Run an accessiblity test that doesn't assert anything, but just logs output. */
    func testNonAsserting() {

        //Omitting viewContrllerID results in loading the initial viewcontroller for the storyboard.
        Attest.that(storyBoardName: "AccessibilityHint").isAccessible({(result:Attest.Result) -> () in
            NSLog(result.description)
        })
    }


    func testHints() {

        Attest.that(storyBoardName: "AccessibilityHint", viewControllerID: "Stepper").isAccessible({(result:Attest.Result) -> () in

            for ruleResult in result.ruleResults {
                switch (ruleResult.rule.ruleId) {
                case .AccessibilityHint:
                    NSLog(ruleResult.description)
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
