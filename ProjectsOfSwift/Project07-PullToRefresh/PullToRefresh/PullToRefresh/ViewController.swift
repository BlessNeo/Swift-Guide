//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Egeo on 2018/11/6.
//  Copyright © 2018 Neo_ZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        
    }
    
    let cellIdentifer = "NewCellIdentifier"
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var arrEmoji = [String]()
    var tableViewController = UITableViewController(style: .plain)
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrEmoji = favoriteEmoji
        let emojiTableView = tableViewController.tableView
        emojiTableView?.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        emojiTableView?.dataSource = self
        emojiTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        emojiTableView?.rowHeight = UITableView.automaticDimension
        emojiTableView?.estimatedRowHeight = 60.0
        emojiTableView?.tableFooterView = UIView(frame: CGRect.zero)
        emojiTableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.view.addSubview(emojiTableView!)
        tableViewController.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), for: .valueChanged)
        refreshControl.backgroundColor = UIColor(red: 0.113, green: 0.113, blue: 0.145, alpha: 1)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        refreshControl.attributedTitle =
        NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        refreshControl.tintColor = UIColor.white
        self.navigationItem.title = "Emoji"
        
    }
    
    @objc func didRoadEmoji()  {
        arrEmoji = newFavoriteEmoji
        tableViewController.tableView .reloadData()
        refreshControl.endRefreshing()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmoji.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as UITableViewCell
        if arrEmoji.count > indexPath.row {
            cell.textLabel?.text = arrEmoji[indexPath.row]
            cell.textLabel?.textAlignment = NSTextAlignment.center
            cell.textLabel?.font = UIFont.systemFont(ofSize: 50)
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
        return cell
    }
    
    
}

