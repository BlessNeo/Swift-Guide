//
//  MainViewController.swift
//  TumblrMenu
//
//  Created by BlessNeo on 2019/6/13.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
    }
    
    /*
     使用Unwind Segues
     https://www.jianshu.com/p/37cc2ebcf617
     */
    @IBAction func unwindToMainCtrl(_ sender: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
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
