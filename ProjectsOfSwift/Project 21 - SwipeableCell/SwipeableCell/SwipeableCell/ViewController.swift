//
//  ViewController.swift
//  SwipeableCell
//
//  Created by BlessNeo on 2019/6/15.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var data = [
        Pattern(image: "1", name: "Pattern Building"),
        Pattern(image: "2", name: "Joe Beez"),
        Pattern(image: "3", name: "Car It's car"),
        Pattern(image: "4", name: "Floral Kaleidoscopic"),
        Pattern(image: "5", name: "Sprinkle Pattern"),
        Pattern(image: "6", name: "Palitos de queso"),
        Pattern(image: "7", name: "Ready to Go? Pattern"),
        Pattern(image: "8", name: "Sets Seamless"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatternCell", for: indexPath) as! PatternCell
        let pattern = data[indexPath.row]
        cell.imgView.image = UIImage(named: pattern.image)
        cell.labTitle.text = pattern.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "🗑\nDelete") { (acttion, index) in
            print("Delete button tapped")
        }
        delete.backgroundColor = UIColor.gray
        let share = UITableViewRowAction(style: .normal, title: "🤗\nShare") { (action, index) in
            let firstActivityItem = self.data[indexPath.row]
            let activityViewController =
            UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
        share.backgroundColor = UIColor.red
        let download = UITableViewRowAction(style: .normal, title: "⬇️\nDownload") { action, index in
            print("Download button tapped")
        }
        download.backgroundColor = UIColor.blue
        return [download, share, delete]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            print("Delete")
        case .insert:
            print("Insert")
        case .none:
            print("None")
        default:
            print("nothing")
        }
    }
    
    
}

