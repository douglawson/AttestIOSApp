//
//  ActiveControl.swift
//  TestApp
//
//  Created by Jennifer Dailey on 10/13/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class ActiveControlButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupButton()
    }
    
    func setupButton() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 3
        self.layer.cornerRadius = 5
    }
}

class ActiveControl: DUViewController, UIScrollViewDelegate {
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var brokenButton: UIButton!
    @IBOutlet weak var brokenLabel: UILabel!
    @IBOutlet weak var brokenDescription: UILabel!
    @IBOutlet weak var brokenButtonView: UIView!
    @IBOutlet weak var fixedLabel: UILabel!
    @IBOutlet weak var fixedButton: UIButton!
    @IBOutlet weak var fixedDescription: UILabel!
    @IBOutlet weak var fixedButtonView: UIView!
    
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
    
    @IBAction func openDU(_ sender: Any) {
        let url = URL.init(string: "http://www.google.com/")
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setA11yPathFor(aView: fixedButton, toBe: fixedButtonView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        brokenButtonView.accessibilityElements = [brokenButton, brokenLabel]
        fixedButton.accessibilityLabel = fixedLabel.text
        
        // Colors
        brokenButton.tintColor = (BROKEN_COLOR)
        fixedButton.tintColor = (FIXED_COLOR)
        wcagButton.tintColor = (DU_BLUE)
        
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.setA11yPathFor(aView: fixedButton, toBe: fixedButtonView)
    }
    
    func setA11yPathFor(aView: UIView, toBe viewsFrame: UIView) {
        aView.accessibilityPath = UIBezierPath(rect: self.view.convert(viewsFrame.frame, from: viewsFrame.superview!))
        aView.accessibilityActivationPoint = self.view.convert(aView.center, from: aView.superview!)
    }
}

