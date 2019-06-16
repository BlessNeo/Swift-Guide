//
//  OpacityViewController.swift
//  BasicAnimation
//
//  Created by BlessNeo on 2019/6/16.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {
    
    @IBOutlet weak var exampleImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2) {
            self.exampleImageView.alpha = 0
        }
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
