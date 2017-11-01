//
//  TouchTargetSize_Example.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/7/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class DefaultTouchTargetSize: UIViewController {
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var brokenSwitch: UISwitch!
    @IBOutlet weak var brokenDescription: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var fixedSwitch: UISwitch!
    @IBOutlet weak var fixedView: UIView!
    @IBOutlet weak var fixedSwitchView: UIView!
    @IBOutlet weak var fixedSwitchDescription: UILabel!
    
    //TODO: Change URL
    @IBAction func openUrl(_ sender: Any) {
        let url = URL.init(string: "URL GOES HERE")
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    @objc private func toggle(_ sender: Any) {
    }
    
    @objc private func toggleSwitch(_ sender: Any) {
        fixedSwitch.setOn(!fixedSwitch.isOn, animated: true)
        self.switchToggled(sender)
    }
    
    @objc private func switchToggled(_ sender: Any) {
        fixedSwitchView.accessibilityLabel = "\(switchLabel.text!), \(boolToString(fixedSwitch.isOn))"
        if fixedSwitch.isOn {
            fixedView.backgroundColor = (FIXED_COLOR)
        } else {
            fixedView.backgroundColor = UIColor.white
        }
    }
    
    private func boolToString(_ isOn: Bool) -> String {
        if isOn { return "ON" }
        else { return "OFF" }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Colors
        brokenSwitch.tintColor = (DU_BLUE)
        brokenSwitch.onTintColor = (DU_BLUE)
        fixedSwitch.tintColor = (FIXED_COLOR)
        fixedSwitch.onTintColor = (FIXED_COLOR)
        
        // Set switch to "off"
        fixedSwitch.isOn = false
        
        brokenSwitch.addTarget(self,
                               action: #selector(toggle(_:)),
                               for: UIControlEvents.valueChanged)
        
        // Add gesture recognizer to fixedView
        fixedSwitch.addTarget(self,
                              action: #selector(switchToggled(_:)),
                              for: UIControlEvents.valueChanged)
        
        fixedSwitchView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(toggleSwitch(_:))))
        fixedSwitchView.accessibilityLabel = "\(switchLabel.text!), \(boolToString(fixedSwitch.isOn))"
        
        if #available(iOS 10.0, *) {
            viewTitle.adjustsFontForContentSizeCategory = true
            brokenDescription.adjustsFontForContentSizeCategory = true
            switchLabel.adjustsFontForContentSizeCategory = true
            fixedSwitchDescription.adjustsFontForContentSizeCategory = true
        }
    }

}
