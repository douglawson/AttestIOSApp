//
//  VoiceOverNavigation_Basic.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/8/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class VoiceOverNavigation : UIViewController {
    @IBOutlet weak var fixedAButton: UIButton!
    @IBOutlet weak var fixedBButton: UIButton!
    @IBOutlet weak var fixedCButton: UIButton!
    @IBOutlet weak var fixedView: FixedView!
    
    @IBAction func wcagLink() {
        let url = URL(string: "https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-focus-order.html")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Fixed version of accessibility violation
        fixedView.accessibilityElements = [fixedAButton, fixedBButton, fixedCButton]
    }
}


