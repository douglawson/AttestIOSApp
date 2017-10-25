//
//  A11yStepper.swift
//  TestApp
//
//  Created by Chris McMeeking on 10/21/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import Foundation
import UIKit

public class A11yStepper : UIView {

    static let HINT_LABEL_TAG = 2;
    static let NAME_LABEL_TAG = 1;
    static let STEPPER_TAG = 3;

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //Properties to fetch various views within the parent container
    var hintLabel: UILabel {
        return viewWithTag(A11yStepper.HINT_LABEL_TAG) as! UILabel
    }

    var nameLabel: UILabel {
        return viewWithTag(A11yStepper.NAME_LABEL_TAG) as! UILabel
    }
    var stepper: UIStepper {
        return viewWithTag(A11yStepper.STEPPER_TAG) as! UIStepper
    }

    //UIAccessibility Protocol Property Implementations
    override public var accessibilityLabel: String? {
        get { return "\(nameLabel.text!), \(hintLabel.text!)" }
        set{}
    }

    override public var accessibilityHint: String? {
        get { return hintLabel.text }
        set {}
    }

    override public var isAccessibilityElement: Bool {
        get { return true }
        set {}
    }

    override public var accessibilityTraits: UIAccessibilityTraits {
        get {
            return UIAccessibilityTraitAdjustable
        }
        set {}
    }

    //UIAccessibility Action Protocol
    override public func accessibilityIncrement() {
        stepper.value += stepper.stepValue
        stepper.sendActions(for: UIControlEvents.valueChanged)
    }

    override public func accessibilityDecrement() {
        stepper.value -= stepper.stepValue
        stepper.sendActions(for: UIControlEvents.valueChanged)
    }
}
