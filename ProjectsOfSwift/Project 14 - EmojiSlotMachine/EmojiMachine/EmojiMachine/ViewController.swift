//
//  ViewController.swift
//  EmojiMachine
//
//  Created by BlessNeo on 2019/6/10.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pickerViewEmoji: UIPickerView!
    
    @IBOutlet weak var btnGo: UIButton!
    @IBOutlet weak var labResult: UILabel!
    
    var arrImage = [String]()
    var arrData1 = [Int]()
    var arrData2 = [Int]()
    var arrData3 = [Int]()
    var amazingFlag = false
    var bounds: CGRect = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bounds = btnGo.bounds
        arrImage = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0...100 {
            self.arrData1.append((Int)(arc4random() % 10))
            self.arrData2.append((Int)(arc4random() % 10))
            self.arrData3.append((Int)(arc4random() % 10))
        }
        
        labResult.text = ""
        pickerViewEmoji.delegate = self
        pickerViewEmoji.dataSource = self
        btnGo.layer.cornerRadius = 6.0
        btnGo.layer.masksToBounds = true
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnGo.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            self.btnGo.alpha = 1
        }, completion: nil)
    }

    @IBAction func btnAmaziongDidTouched(_ sender: UIButton) {
        amazingFlag = !amazingFlag
        sender.setTitle(amazingFlag ? "开挂模式" : "常规模式",
                        for: .normal)
    }
    
    @IBAction func btnGoDidTouched(_ sender: Any) {
        let index1: Int
        let index2: Int
        let index3: Int
        if amazingFlag {
            index1 = Int(arc4random()) % 90 + 3
            index2 = arrData2.firstIndex(of: arrData1[index1])!
            index3 = arrData3.lastIndex(of: arrData1[index1])!
        } else {
            index1 = Int(arc4random()) % 90 + 3
            index2 = Int(arc4random()) % 90 + 3
            index3 = Int(arc4random()) % 90 + 3
        }
        
        pickerViewEmoji.selectRow(index1, inComponent: 0, animated: true)
        pickerViewEmoji.selectRow(index2, inComponent: 1, animated: true)
        pickerViewEmoji.selectRow(index3, inComponent: 2, animated: true)
        
        if arrData1[pickerViewEmoji.selectedRow(inComponent: 0)] ==
            arrData2[pickerViewEmoji.selectedRow(inComponent: 1)] &&
            arrData2[pickerViewEmoji.selectedRow(inComponent: 1)] ==
            arrData3[pickerViewEmoji.selectedRow(inComponent: 2)]{
            labResult.text = "Bingo!"
        } else {
            labResult.text = "💔"
        }
        
        //animate
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
            self.btnGo.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width - 20, height: self.bounds.size.height)
        }) { (compelete: Bool) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
                self.btnGo.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
            }, completion: nil)
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = arrImage[(Int)(arrData1[row])]
        } else if component == 1 {
            pickerLabel.text = arrImage[(Int)(arrData2[row])]
        } else {
            pickerLabel.text = arrImage[(Int)(arrData3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
}

