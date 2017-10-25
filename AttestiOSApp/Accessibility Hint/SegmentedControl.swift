//
//  SegmentedControl.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/30/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class SegmentedControl: DUViewController {
    
    let RED_SEGMENT_INDEX = 0
    let GREEN_SEGMENT_INDEX = 0
    
    @IBOutlet weak var viewTitle: UILabel!
    
    @IBOutlet weak var brokenView: BrokenView!
    @IBOutlet weak var brokenSegmentedControl: UISegmentedControl!
    @IBOutlet weak var brokenLabel: UILabel!
    @IBOutlet weak var brokenDescription: UILabel!
    
    @IBOutlet weak var fixedView: FixedView!
    @IBOutlet weak var fixedSegmentedControl: UISegmentedControl!
    @IBOutlet weak var fixedLabel: UILabel!
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
        brokenSegmentedControl.tintColor = (BROKEN_COLOR)
        fixedSegmentedControl.tintColor = (GREEN)
        wcagButton.tintColor = (DU_BLUE)
        
        // Add accessibility hints to the segmented control for fixed example
        fixedSegmentedControl.subviews[0].accessibilityHint = "Updates the border color of this view to be blue."
        fixedSegmentedControl.subviews[1].accessibilityHint = "Updates the border color of this view to be green."
        
        // Make "broken" segmented control change the label
        brokenSegmentedControl.addTarget(self,
                                         action: #selector(brokenSegmentedCtrlFunc(_:)),
                                         for: UIControlEvents.valueChanged)
        
        // Make "fixed" segmented control change the label
        fixedSegmentedControl.addTarget(self,
                                        action: #selector(fixedSegmentedCtrlFunc(_:)),
                                        for: UIControlEvents.valueChanged)
        
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
    
    @objc func brokenSegmentedCtrlFunc(_ sender: Any) {
        if brokenSegmentedControl.selectedSegmentIndex == RED_SEGMENT_INDEX {
            brokenView.layer.borderColor = (BROKEN_COLOR).cgColor
            brokenSegmentedControl.tintColor = (BROKEN_COLOR)
        } else {
            brokenView.layer.borderColor = (DU_BLUE).cgColor
            brokenSegmentedControl.tintColor = (DU_BLUE)
        }
    }
    
    @objc func fixedSegmentedCtrlFunc(_ sender: Any) {
        if fixedSegmentedControl.selectedSegmentIndex == GREEN_SEGMENT_INDEX {
            fixedView.layer.borderColor = (GREEN).cgColor
            fixedSegmentedControl.tintColor = (GREEN)
        } else {
            fixedView.layer.borderColor = (DU_BLUE).cgColor
            fixedSegmentedControl.tintColor = (DU_BLUE)
        }
    }
}
