//
//  DynamicType_Listener.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/1/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class FontType: DUViewController {
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var brokenDescription: UILabel!
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
   /*
    func preferredContentSizeCategory() {
        let categorySize = UIApplication.shared.preferredContentSizeCategory
        var font = brokenDescription.font
        
        if categorySize == UIContentSizeCategory.extraSmall {
            font = UIFont.systemFont(ofSize: 14)
        } else if categorySize == UIContentSizeCategory.small {
            font = UIFont.systemFont(ofSize: 15)
        } else if categorySize == UIContentSizeCategory.medium {
            font = UIFont.systemFont(ofSize: 16)
        } else if categorySize == UIContentSizeCategory.large {
            font = UIFont.systemFont(ofSize: 17)
        } else if categorySize == UIContentSizeCategory.extraLarge {
            font = UIFont.systemFont(ofSize: 19)
        } else if categorySize == UIContentSizeCategory.extraExtraLarge {
            font = UIFont.systemFont(ofSize: 21)
        } else if categorySize == UIContentSizeCategory.extraExtraExtraLarge {
            font = UIFont.systemFont(ofSize: 23)
        } else if categorySize == UIContentSizeCategory.accessibilityMedium {
            font = UIFont.systemFont(ofSize: 28)
        } else if categorySize == UIContentSizeCategory.accessibilityLarge {
            font = UIFont.systemFont(ofSize: 31)
        } else if categorySize == UIContentSizeCategory.accessibilityExtraLarge {
            font = UIFont.systemFont(ofSize: 40)
        } else if categorySize == UIContentSizeCategory.accessibilityExtraExtraLarge {
            font = UIFont.systemFont(ofSize: 48)
        } else {
            font = UIFont.systemFont(ofSize: 56)
        }
        
        brokenDescription.font = font
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wcagButton.tintColor = (DU_BLUE)
        //self.preferredContentSizeCategory()
      
        //NotificationCenter.default.addObserver(self, selector: #selector(preferredContentSizeCategory), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
        
        if #available(iOS 10.0, *) {
            viewTitle.adjustsFontForContentSizeCategory = true
            brokenDescription.adjustsFontForContentSizeCategory = true
            fixedDescription.adjustsFontForContentSizeCategory = true
            wcagButton.titleLabel!.adjustsFontForContentSizeCategory = true
        }
    }

}
