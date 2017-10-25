//
//  DUStoryTableViewController.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/29/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

let RULES_IDENTIFIER = "Rules"
let RULES_STORIES_IDENTIFIER = "RuleStoriesCell"

let RULES_TITLE_TAG = 90
let RULE_LABEL_TAG = 101
let RULE_IMAGE_TAG = 110

let RULES_SECTION_NUM = 0
let RULES_STORIES_NUM = 1

class DUStoryTableViewController: UITableViewController {

    // color scheme
    var _colorCellText = UIColor()
    var _colorMenuBackground = UIColor()
    var _colorCellBackgroundDimmed = UIColor()
    var _colorCellBackgroundSelected = UIColor()
    
    @objc private func didChangePreferredContentSize() {

        let contentSize = UIApplication.shared.preferredContentSizeCategory
        if contentSize == UIContentSizeCategory.extraSmall {
            self.tableView.rowHeight = 36
        } else if contentSize == UIContentSizeCategory.small {
            self.tableView.rowHeight = 40
        } else if contentSize == UIContentSizeCategory.medium {
            self.tableView.rowHeight = 44
        } else if contentSize == UIContentSizeCategory.large {
            self.tableView.rowHeight = 48
        } else if contentSize == UIContentSizeCategory.extraLarge {
            self.tableView.rowHeight = 52
        } else if contentSize == UIContentSizeCategory.extraExtraLarge {
            self.tableView.rowHeight = 56
        } else if contentSize == UIContentSizeCategory.extraExtraExtraLarge {
            self.tableView.rowHeight = 60
        }
    }
    
    private func createTableViewCellFromArray(_ cellNames: [String], identifier: String, forIndexPath indexPath: IndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        let label = cell.viewWithTag(RULE_LABEL_TAG) as! UILabel
        let image = cell.viewWithTag(RULE_IMAGE_TAG) as! UIImageView
        
        let ruleId = cellNames[indexPath.row]
        label.text = ruleId
        label.isAccessibilityElement = false
        label.textColor = _colorCellText
        image.image = UIImage(named: "DequeU_app_icon_about.png")
        
        if #available(iOS 10.0, *) {
            label.adjustsFontForContentSizeCategory = true
        }
        
        // setting accessibility label
        var demoTab = ""
        
        if identifier == RULES_STORIES_IDENTIFIER {
            demoTab = ", Rules Tab,"
        }
        
        demoTab += String.localizedStringWithFormat("%tu of ", indexPath.row + 1)
        
        cell.accessibilityLabel = label.text! + demoTab + String.localizedStringWithFormat("%lu", cellNames.count)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.clearsSelectionOnViewWillAppear = false
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.didChangePreferredContentSize()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didChangePreferredContentSize), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
        
        // Colors
        _colorCellText = (DARK_BLUE)
        _colorMenuBackground = (DQ_COLOR_WORLDSPACE_WHITE)
        _colorCellBackgroundDimmed = (DQ_COLOR_WORLDSPACE_WHITE)
        _colorCellBackgroundSelected = (LIGHT_BLUE)
        
        // Set color scheme
        self.tableView.backgroundColor = _colorMenuBackground
        self.tableView.backgroundView = nil
        
        // selecting introduction cell
        let indexPath = IndexPath.init(row: 0, section: 1)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.bottom)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == RULES_STORIES_NUM {
            return Demos.count()
        }
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        var label: UILabel
        
        if indexPath.section == RULES_SECTION_NUM {
            cell = tableView.dequeueReusableCell(withIdentifier: RULES_IDENTIFIER, for: indexPath)
            label = cell.viewWithTag(RULES_TITLE_TAG) as! UILabel
            label.text = "RULES"
            label.accessibilityLabel = "RULES"
        } else {
            cell = self.createTableViewCellFromArray(Demos.names(), identifier: RULES_STORIES_IDENTIFIER, forIndexPath: indexPath)
        }
        
        let selectedView = UIView()
        selectedView.backgroundColor = _colorCellBackgroundSelected
        cell.selectedBackgroundView = selectedView
        cell.backgroundColor = _colorCellBackgroundDimmed
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {

        if indexPath.section == RULES_SECTION_NUM {
            return nil
        }
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == RULES_STORIES_NUM {
            let pattern = Demos.values()[indexPath.row]
            let viewController = pattern.makeViewController()
            viewController.title = "\(pattern)"
            self.splitViewController!.showDetailViewController(viewController, sender: nil)
        }
    }
}
