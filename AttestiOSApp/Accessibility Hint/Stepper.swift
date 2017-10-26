//
//  A11yHintStepperViewController.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/30/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class Stepper: DUViewController {

    @IBOutlet weak var brokenStepper: UIStepper!
    @IBOutlet weak var brokenCounter: UILabel!

    @IBOutlet weak var fixedStepper: UIStepper!
    @IBOutlet weak var fixedCounter: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Show "broken" stepper's value when incremented/decremented
        brokenStepper.addTarget(self,
                                action: #selector(brokenStepperFunc(_:)),
                                for: UIControlEvents.valueChanged)
        
        // Show "fixed" stepper's value when incremented/decremented
        fixedStepper.addTarget(self,
                               action: #selector(fixedStepperFunc(_:)),
                               for: UIControlEvents.valueChanged)
        
        // Add accessibility hints to the stepper for fixed example
        fixedStepper.subviews[0].accessibilityHint = "Decreases number of tomatoes by 1."
        fixedStepper.subviews[1].accessibilityHint = "Increases number of tomatoes by 1."
    }
    
    @objc private func brokenStepperFunc(_ sender: Any) {

        if (brokenCounter.text!.contains("Tom")) {
            brokenCounter.text = "\(Int(brokenStepper.value)) Tomatoes"
        } else {
            brokenCounter.text = "\(Int(brokenStepper.value)) Bananas"
        }

        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, brokenCounter.text)
    }
    
    @objc private func fixedStepperFunc(_ sender: Any) {

        if (fixedCounter.text!.contains("Tom")) {
            fixedCounter.text = "\(Int(fixedStepper.value)) Tomatoes"
        } else {
            fixedCounter.text = "\(Int(fixedStepper.value)) Bananas"
        }

        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, fixedCounter.text)
    }
}
