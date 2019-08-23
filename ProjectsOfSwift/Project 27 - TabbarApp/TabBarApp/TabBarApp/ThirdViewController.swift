//
//  ThirdViewController.swift
//  TabBarApp
//
//  Created by BlessNeo on 2019/8/21.
//  Copyright © 2019 Swift. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var imgViewExplore: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetViewTransform()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.imgViewExplore.alpha = 1
            self.imgViewExplore.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resetViewTransform()
    }
    
    func resetViewTransform() {
        self.imgViewExplore.alpha = 0
        self.imgViewExplore.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
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
