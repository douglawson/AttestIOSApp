//
//  TouchTargetSize_Example.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/7/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class TouchTargetSize: UIViewController {
    @IBOutlet weak var brokenView: BrokenView!
    @IBOutlet weak var fixedSwitch: UISwitch!
    @IBOutlet weak var fixedSwitchLabel: UILabel!
    @IBOutlet weak var fixedView: FixedView!
    @IBOutlet weak var fixedSwitchView: UIView!
    
    @IBAction func wcagLink() {
        let url = URL(string: "https://www.w3.org/TR/WCAG21/#target-size")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    // Called by brokenSwitch
    @IBAction func changeBackgroundColor(_ sender: Any) {
        if (sender as! UISwitch).isOn {
            brokenView.backgroundColor = BROKEN_COLOR
        } else {
            brokenView.backgroundColor = UIColor.white
        }
    }
    
    // Called by fixedSwitch and fixedSwitchView
    @IBAction func toggleBackgroundColor(_ sender: Any) {
        
        // Toggle switch if view was tapped
        if !(sender is UISwitch) {
            fixedSwitch.setOn(!fixedSwitch.isOn, animated: true)
        }
        
        // Update background color
        if fixedSwitch.isOn {
            fixedView.backgroundColor = FIXED_COLOR
        } else {
            fixedView.backgroundColor = UIColor.white
        }
        
        // Update accessibility label of tappable view
        updateAccessibilityLabel()
        
    }
    
    // Convert bool to a readable string
    private func boolToString(_ isOn: Bool) -> String {
        if isOn { return "ON" }
        else { return "OFF" }
    }
    
    private func updateAccessibilityLabel() {
        fixedSwitchView.accessibilityLabel = "\(fixedSwitchLabel.text!), \(boolToString(fixedSwitch.isOn))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add gesture recognizer to fixedView
        fixedSwitchView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(toggleBackgroundColor(_:))))
        
        // Update accessibility label of tappable view
        updateAccessibilityLabel()

    }
}
