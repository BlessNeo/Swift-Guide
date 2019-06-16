//
//  ScaleViewController.swift
//  BasicAnimation
//
//  Created by BlessNeo on 2019/6/16.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {
    
     @IBOutlet weak var scaleImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
         self.scaleImageView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.scaleImageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.scaleImageView.alpha = 1
            
        }, completion: nil )
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
