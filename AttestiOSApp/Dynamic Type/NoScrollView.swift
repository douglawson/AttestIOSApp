//
//  DynamicType_Scroll.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/1/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class NoScrollView: DUViewController {
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var brokenText: UILabel!
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
        
        wcagButton.tintColor = (DU_BLUE)
        
        if #available(iOS 10.0, *) {
            viewTitle.adjustsFontForContentSizeCategory = true
            brokenText.adjustsFontForContentSizeCategory = true
            fixedDescription.adjustsFontForContentSizeCategory = true
            wcagButton.titleLabel!.adjustsFontForContentSizeCategory = true
        }
    }
}
