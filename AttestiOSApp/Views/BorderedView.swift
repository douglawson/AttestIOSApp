//
//  BorderedView.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/31/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

@IBDesignable internal class BorderedView: UIView {
    
    internal enum ViewType {
        case Broken
        case Fixed
        case Example
    }
    
    internal var type = ViewType.Example
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    fileprivate func setUp() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        
        switch(type) {
            case ViewType.Broken: self.layer.borderColor = (BROKEN_COLOR).cgColor
            case ViewType.Fixed: self.layer.borderColor = (FIXED_COLOR).cgColor
            case ViewType.Example: self.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}

class BrokenView: BorderedView {
    override internal var type: BorderedView.ViewType {
        get {
            return BorderedView.ViewType.Broken
        }
        set {}
    }
}

class FixedView: BorderedView {
    override internal var type: BorderedView.ViewType {
        get {
            return BorderedView.ViewType.Fixed
        }
        set {}
    }
}
