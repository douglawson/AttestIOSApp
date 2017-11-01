//
//  TouchTargetSize_ScreenSize.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/25/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class TouchTargetSizeScreenDependent : UIViewController {
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var brokenButton: UIButton!
    @IBOutlet weak var brokenDescription: UILabel!
    @IBOutlet weak var fixedButton: UIButton!
    @IBOutlet weak var fixedDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brokenButton.tintColor = (DU_BLUE)
        fixedButton.tintColor = (DU_BLUE)
        
        if #available(iOS 10.0, *) {
            viewTitle.adjustsFontForContentSizeCategory = true
            brokenButton.titleLabel!.adjustsFontForContentSizeCategory = true
            brokenDescription.adjustsFontForContentSizeCategory = true
            fixedButton.titleLabel!.adjustsFontForContentSizeCategory = true
            fixedDescription.adjustsFontForContentSizeCategory = true
        }
    }
}
