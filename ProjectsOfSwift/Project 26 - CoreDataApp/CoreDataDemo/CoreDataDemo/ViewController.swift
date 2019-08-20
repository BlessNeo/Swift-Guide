//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by BlessNeo on 2019/8/20.
//  Copyright © 2019 Swift. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    var listItems = [NSManagedObject]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.addItem))
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContex = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListEntity")
        
        do {
            let result = try managedContex.fetch(fetchRequest)
            listItems = result as! [NSManagedObject]
            self.tableView.reloadData()
        } catch  {
            print("error")
        }
        
    }
    
    @objc func addItem() {
        let alertCtrl = UIAlertController(title: "这是标题", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "确定", style: .default) { (_) in
            if let field = alertCtrl.textFields![0] as? UITextField {
                self.saveItem(itemToSave: field.text!)
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertCtrl.addTextField { (textField) in
            textField.placeholder = "输入点儿啥吧"
        }
        alertCtrl.addAction(confirmAction)
        alertCtrl.addAction(cancelAction)
        self.present(alertCtrl, animated: true, completion: nil)
    }
    
    func saveItem(itemToSave: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContex = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "ListEntity", in: managedContex)
        let item = NSManagedObject(entity: entity!, insertInto: managedContex)
        item.setValue(itemToSave, forKey: "item")
        do {
            try managedContex.save()
            listItems.append(item)
        } catch  {
            print("error")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        let item = listItems[indexPath.row]
        cell.textLabel?.text = item.value(forKey: "item") as? String
        cell.textLabel?.font = UIFont(name: "", size: 25)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "删除") { (action, index) in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContex = appDelegate.managedObjectContext
            tableView.reloadRows(at: [indexPath], with: .right)
            managedContex.delete(self.listItems[indexPath.row])
            
            do {
                try managedContex.save()
                self.listItems.remove(at: indexPath.row)
                self.tableView.reloadData()
            } catch {
                print("error: delete")
            }
        }
        
        delete.backgroundColor = UIColor.red
        
        return [delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }


}

