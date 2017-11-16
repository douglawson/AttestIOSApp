//
//  LabelActiveControls.swift
//  TestApp
//
//  Created by Jennifer Dailey on 10/13/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class LabelActiveControls: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var brokenButton: UIButton!
    @IBOutlet weak var brokenLabel: UILabel!
    @IBOutlet weak var brokenButtonView: UIView!
    @IBOutlet weak var fixedLabel: UILabel!
    @IBOutlet weak var fixedButton: UIButton!
    @IBOutlet weak var fixedButtonView: UIView!
    
    @IBAction func openLink(_ sender: Any) {
        let url = URL.init(string: "http://www.google.com/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        brokenButtonView.accessibilityElements = [brokenLabel, brokenButton]
        fixedButtonView.accessibilityLabel = fixedLabel.text
        
        fixedButtonView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(openLink(_:))))
    }
}

