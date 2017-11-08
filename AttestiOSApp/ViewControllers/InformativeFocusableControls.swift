//
//  InformativeFocusableControls.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 11/8/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import Foundation
import UIKit

class InformativeFocusableControls : UIViewController {
    @IBOutlet weak var brokenLabel1: UILabel!
    @IBOutlet weak var brokenLabel2: UILabel!
    @IBOutlet weak var fixedView: FixedView!
    @IBOutlet weak var fixedLabel1: UILabel!
    @IBOutlet weak var fixedLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brokenLabel1.accessibilityLabel = "\(brokenLabel2.text!)"
        fixedView.accessibilityLabel = "\(fixedLabel1.text!), \(fixedLabel2.text!)"
    }
}
