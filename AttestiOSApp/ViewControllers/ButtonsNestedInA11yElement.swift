//
//  NestedA11yElements_Example.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/7/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class ButtonsNestedInA11yElement: UIViewController {
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var brokenButton1: UIButton!
    @IBOutlet weak var brokenButton2: UIButton!
    @IBOutlet weak var brokenDescription: UILabel!
    @IBOutlet weak var fixedButton1: UIButton!
    @IBOutlet weak var fixedButton2: UIButton!
    @IBOutlet weak var fixedDescription: UILabel!
    
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

        brokenButton1.isAccessibilityElement = true
        brokenButton2.isAccessibilityElement = true
        
        // Colors
        brokenButton1.tintColor = (DU_BLUE)
        brokenButton2.tintColor = (DU_BLUE)
        fixedButton1.tintColor = (DU_BLUE)
        fixedButton2.tintColor = (DU_BLUE)
        
        if #available(iOS 10.0, *) {
            viewTitle.adjustsFontForContentSizeCategory = true
            brokenButton1.titleLabel!.adjustsFontForContentSizeCategory = true
            brokenButton2.titleLabel!.adjustsFontForContentSizeCategory = true
            brokenDescription.adjustsFontForContentSizeCategory = true
            fixedButton1.titleLabel!.adjustsFontForContentSizeCategory = true
            fixedButton2.titleLabel!.adjustsFontForContentSizeCategory = true
            fixedDescription.adjustsFontForContentSizeCategory = true
        }
    }
}
