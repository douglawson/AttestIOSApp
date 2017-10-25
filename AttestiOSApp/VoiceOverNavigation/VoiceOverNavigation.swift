//
//  VoiceOverNavigation_Basic.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/8/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class VoiceOverNavigation : DUViewController {
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var brokenAButton: UIButton!
    @IBOutlet weak var brokenBButton: UIButton!
    @IBOutlet weak var brokenCButton: UIButton!
    @IBOutlet weak var brokenDescription: UILabel!
    @IBOutlet weak var fixedAButton: UIButton!
    @IBOutlet weak var fixedBButton: UIButton!
    @IBOutlet weak var fixedCButton: UIButton!
    @IBOutlet weak var fixedDescription: UILabel!
    @IBOutlet weak var fixedView: FixedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brokenAButton.tintColor = (DU_BLUE)
        brokenBButton.tintColor = (DU_BLUE)
        brokenCButton.tintColor = (DU_BLUE)
        fixedAButton.tintColor = (DU_BLUE)
        fixedBButton.tintColor = (DU_BLUE)
        fixedCButton.tintColor = (DU_BLUE)
        
        // Fixed version of accessibility violation
        fixedView.accessibilityElements = [fixedAButton, fixedBButton, fixedCButton]
        
        if #available(iOS 10.0, *) {
            viewTitle.adjustsFontForContentSizeCategory = true
            brokenAButton.titleLabel!.adjustsFontForContentSizeCategory = true
            brokenBButton.titleLabel!.adjustsFontForContentSizeCategory = true
            brokenCButton.titleLabel!.adjustsFontForContentSizeCategory = true
            brokenDescription.adjustsFontForContentSizeCategory = true
            fixedAButton.titleLabel!.adjustsFontForContentSizeCategory = true
            fixedBButton.titleLabel!.adjustsFontForContentSizeCategory = true
            fixedCButton.titleLabel!.adjustsFontForContentSizeCategory = true
            fixedDescription.adjustsFontForContentSizeCategory = true
        }
    }
}


