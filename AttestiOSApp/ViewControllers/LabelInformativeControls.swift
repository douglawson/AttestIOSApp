//
//  LabelInformativeControls.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 11/17/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class LabelInformativeControls : UIViewController {
    @IBAction func wcagLink() {
        let url = URL(string: "https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}
