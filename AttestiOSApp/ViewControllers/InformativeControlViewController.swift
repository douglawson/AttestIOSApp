//
//  InformativeControlViewController.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 11/17/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class InformativeControlViewController: UIViewController {

    @IBAction func wcagLink() {
        let url = URL(string: "https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-visual-presentation.html")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
