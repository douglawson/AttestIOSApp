//
//  DUSplitViewController.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/29/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import Foundation
import UIKit

public enum Demos: Int {

    case ColorContrast_ColorContrast
    case ColorContrast_BlendedBackground
    case ColorContrast_BlendedText
    case ColorContrast_LargeText
    case ConflictingTraits_ConflictingTraitsOnButton
    case Overlap_OverlappingButton
    case Overlap_OverlappingLabel
    case DynamicType_FontType
    //case AccessibilityHint_SegmentedControl
    case AccessibilityHint_Stepper
    //case AccessibilityHint_StepperBestPractice
    case InHighlight_NotInFrame
    case NestedA11yElements_ButtonsNestedInA11yElement
    case SpeakableText_ActiveControl
    case SpeakableText_InformativeControl
    case TouchTargetSize_DefaultTouchTargetSize

    public func makeViewController() -> UIViewController {
        return UIStoryboard(name: self.storyBoardName(), bundle: nil).instantiateViewController(withIdentifier: self.viewControllerName())
    }

    public func storyBoardName() -> String {
        return String("\(self)".components(separatedBy: "_")[0])
    }

    public func viewControllerName() -> String {
        return String("\(self)".components(separatedBy: "_")[1])
    }

    public static func count() -> Int {
        return names().count
    }

    public static func values() -> [Demos] {
        var results: [Demos] = []

        for index in 0 ... Int.max {
            if let pattern = Demos.init(rawValue: index) {
                results.append(pattern)
            } else {
                break
            }
        }

        return results
    }

    public static func names() -> [String] {
        var results: [String] = []

        for index in 0 ... Int.max {
            if let pattern = Demos.init(rawValue: index) {
                results.append("\(pattern)")
            } else {
                break
            }
        }

        return results
    }
}

class MainViewController : UISplitViewController, UISplitViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredDisplayMode = UISplitViewControllerDisplayMode.allVisible
    }
}
