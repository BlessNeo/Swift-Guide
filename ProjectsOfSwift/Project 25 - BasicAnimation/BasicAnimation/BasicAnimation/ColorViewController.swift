//
//  ColorViewController.swift
//  BasicAnimation
//
//  Created by BlessNeo on 2019/6/16.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var bgColorView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseIn, animations: {
            self.bgColorView.backgroundColor = .black
            
        }, completion: nil )
        
        UIView.animate(withDuration: 0.5, delay: 0.8, options: .curveEaseOut, animations: {
            self.numberLabel.textColor = UIColor(red:0.959, green:0.937, blue:0.109, alpha:1)
            
        }, completion: nil)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
