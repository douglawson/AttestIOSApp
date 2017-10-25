//
//  DUConstants.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/29/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

extension UIColor {
    static func colorWithHexString(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        // String should be 6 or 8 characters
        if hexString.characters.count < 6 { return UIColor.gray }

        if hexString.contains("X") { hexString = String(hexString[hexString.index(of: "X")!...]) }

        if hexString.characters.count != 6 { return UIColor.gray }

        // Separate into r, g, and b substrings
        var start = hexString.startIndex
        var end = hexString.index(hexString.startIndex, offsetBy: 2)
        let rString = hexString[Range(start..<end)]

        start = end
        end = hexString.index(hexString.startIndex, offsetBy: 4)
        let gString = hexString[Range(start..<end)]

        start = end
        end = hexString.endIndex
        let bString = hexString[Range(start..<end)]

        // Scan values
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        (Scanner.localizedScanner(with: String(rString)) as! Scanner).scanHexInt32(&r)
        (Scanner.localizedScanner(with: String(gString)) as! Scanner).scanHexInt32(&g)
        (Scanner.localizedScanner(with: String(bString)) as! Scanner).scanHexInt32(&b)

        return UIColor.init(red: CGFloat(Double(r)/255.0), green: CGFloat(Double(g)/255.0), blue: CGFloat(Double(b)/255.0), alpha: 1)
    }
}

//! Constants for colors in this project.
let ORANGE = UIColor.colorWithHexString("EA3700")
let DARK_BLUE = UIColor.colorWithHexString("021B3F")
let LIGHT_BLUE = UIColor.colorWithHexString("E0EDF9")
let BLUE = UIColor.colorWithHexString("093C8F")
let GREEN = UIColor.colorWithHexString("2D6B20")
let GRAY = UIColor.colorWithHexString("E0E3E9")
let DQ_COLOR_WORLDSPACE_WHITE = UIColor.colorWithHexString("F2F2F4")
let BROKEN_COLOR = UIColor.colorWithHexString("DC341A")
let FIXED_COLOR = UIColor.colorWithHexString("72BA32")
let DU_BLUE = UIColor.colorWithHexString("093C8F")

