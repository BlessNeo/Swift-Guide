//
//  ViewController.swift
//  CustomFont
//
//  Created by Egeo on 2018/10/31.
//  Copyright © 2018 Neo_ZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrData = ["When you are old and grey and full of sleep,",
                   "And nodding by the fire, take down this book,",
                   "And slowly read, and dream of the soft look",
                   "Your eyes had once, and of their shadows deep;",
                   "",
        "我打江南走过",
        "那等在季节里的容颜如莲花的开落",
        "东风不来，三月的柳絮不飞",
        "你的心如小小的寂寞的城",
        "恰若青石的街道向晚",
        "跫音不响，三月的春帷不揭",
        "你底心是小小的窗扉紧掩",
        "我达达的马蹄是美丽的错误",
        "我不是归人，是个过客……"]
    /*
     1.在 info.plist 中添加 Fonts provided by application 选项，然后在数组中填写你
     导入的字体资源名，注意是字体资源名而不是字体名
     2.字体名的获取可通过 Mac 自带的软件字体册去查看获取
     3.第二、三个字体资源 Zapfino、Futura 是系统自带字体
     4.最后一个字体名为空，会取系统默认字体
     */
    //这个数组是字体名，不是字体资源名
    var arrFontNames = ["Gaspar",
                        "Zapfino",
                        "Futura",
                        "MFZhiHei_Noncommercial-Regular",
                        "MFJinHei_Noncommercial-Regular",
                        "MFTongXin_Noncommercial-Regular",
                        ""]
    var indexFontRow = 0
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnChangeFont: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnChangeFont.layer.cornerRadius = btnChangeFont.bounds.size.height / 2.0
        //系统字体名
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family){
                print(font)
            }
        }
    }

    @IBAction func btnChangeFontPressed(_ sender: Any) {
        indexFontRow = (indexFontRow + 1) % 7
        print(arrFontNames[indexFontRow])
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.textAlignment = NSTextAlignment.center
        if arrData.count > indexPath.row {
            cell.textLabel?.text = arrData[indexPath.row]
            cell.textLabel?.font = UIFont(name: arrFontNames[indexFontRow],
                                           size: 16)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35.0
    }
    
    
}

