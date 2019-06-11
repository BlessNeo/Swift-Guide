//
//  BaseTableViewController.swift
//  SlideMenu
//
//  Created by BlessNeo on 2019/6/11.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit
import Foundation

class BaseTableViewController: UITableViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

}
