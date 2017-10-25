//
//  A11yHintStepperViewController.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/30/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class Stepper: DUViewController {
    @IBOutlet weak var viewTitle: UILabel!
    
    @IBOutlet weak var brokenTitle: UILabel!
    @IBOutlet weak var brokenStepper: UIStepper!
    @IBOutlet weak var brokenCounter: UILabel!
    @IBOutlet weak var brokenDescription: UILabel!
    
    @IBOutlet weak var fixedTitle: UILabel!
    @IBOutlet weak var fixedStepper: UIStepper!
    @IBOutlet weak var fixedCounter: UILabel!
    @IBOutlet weak var fixedDescription: UILabel!
    @IBOutlet weak var wcagButton: UIButton!
    
    //TODO: Change URL
    @IBAction func openUrl(_ sender: Any) {
        let url = URL.init(string: "URL GOES HERE")
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Colors
        brokenStepper.tintColor = (DU_BLUE)
        fixedStepper.tintColor = (DU_BLUE)
        wcagButton.tintColor = (DU_BLUE)
        
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
        
        // Dynamic Type
        if #available(iOS 10.0, *) {
            viewTitle.adjustsFontForContentSizeCategory = true
            brokenTitle.adjustsFontForContentSizeCategory = true
            brokenCounter.adjustsFontForContentSizeCategory = true
            brokenDescription.adjustsFontForContentSizeCategory = true
            
            fixedTitle.adjustsFontForContentSizeCategory = true
            fixedCounter.adjustsFontForContentSizeCategory = true
            fixedDescription.adjustsFontForContentSizeCategory = true
            wcagButton.titleLabel!.adjustsFontForContentSizeCategory = true
        }
        
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
