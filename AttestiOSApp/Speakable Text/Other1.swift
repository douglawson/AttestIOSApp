//
//  ActiveControls_Switch.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/30/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class Other1: DUViewController {
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var brokenSwitch: UISwitch!
    @IBOutlet weak var brokenLabel: UILabel!
    @IBOutlet weak var brokenDescription: UILabel!
    @IBOutlet weak var brokenView: BrokenView!
    @IBOutlet weak var brokenSwitchView: UIView!
    @IBOutlet weak var fixedLabel: UILabel!
    @IBOutlet weak var fixedSwitch: UISwitch!
    @IBOutlet weak var fixedDescription: UILabel!
    @IBOutlet weak var fixedView: FixedView!
    @IBOutlet weak var fixedSwitchView: UIView!
    
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
        brokenSwitch.onTintColor = (BROKEN_COLOR)
        brokenSwitch.tintColor = (BROKEN_COLOR)
        fixedSwitch.onTintColor = (FIXED_COLOR)
        fixedSwitch.tintColor = (FIXED_COLOR)
        wcagButton.tintColor = (DU_BLUE)
        
        // Set Switches to "OFF"
        brokenSwitch.setOn(false, animated: false)
        fixedSwitch.setOn(false, animated: false)
        
        // Toggle background color when "broken" switch is tapped
        brokenSwitch.addTarget(self,
                               action: #selector(brokenSwitchFunc(_:)),
                               for: UIControlEvents.valueChanged)
        
        // Toggle background color when "fixed" switch is tapped
        fixedSwitch.addTarget(self,
                              action: #selector(fixedSwitchFunc(_:)),
                              for: UIControlEvents.valueChanged)
        
        // Toggle background color when view containing switch is tapped
        fixedSwitchView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(fixedViewFunc(_:))))
        fixedSwitchView.accessibilityLabel = "\(fixedLabel.text!), \(boolToString(fixedSwitch.isOn))"

        brokenSwitchView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(brokenSwitchFunc(_:))))
        
        // Dynamic Type
        if #available(iOS 10.0, *) {
            viewTitle.adjustsFontForContentSizeCategory = true
            brokenLabel.adjustsFontForContentSizeCategory = true
            brokenDescription.adjustsFontForContentSizeCategory = true
            fixedLabel.adjustsFontForContentSizeCategory = true
            fixedDescription.adjustsFontForContentSizeCategory = true
            wcagButton.titleLabel!.adjustsFontForContentSizeCategory = true
        }
    }
    
    func boolToString(_ isOn: Bool) -> String {
        if isOn { return "On" }
        else { return "Off" }
    }
    
    @objc func brokenSwitchFunc(_ sender: Any) {
        if brokenSwitch.isOn {
            brokenView.backgroundColor = (BROKEN_COLOR)
        } else {
            brokenView.backgroundColor = UIColor.white
        }
    }
    
    @objc func fixedSwitchFunc(_ sender: Any) {
        fixedSwitchView.accessibilityLabel = "\(fixedLabel.text!), \(boolToString(fixedSwitch.isOn))"
        
        if fixedSwitch.isOn {
            fixedView.backgroundColor = (FIXED_COLOR)
        } else {
            fixedView.backgroundColor = UIColor.white
        }
    }
    
    @objc func fixedViewFunc(_ sender: Any) {
        fixedSwitch.setOn(!fixedSwitch.isOn, animated: true)
        fixedSwitchFunc(sender)
    }
}
