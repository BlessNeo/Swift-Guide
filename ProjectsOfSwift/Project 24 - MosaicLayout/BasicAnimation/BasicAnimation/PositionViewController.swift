//
//  PositionViewController.swift
//  BasicAnimation
//
//  Created by BlessNeo on 2019/6/16.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {
    
    @IBOutlet weak var yellowSquareView: UIView!
    @IBOutlet weak var blueSquareView: UIView!
    @IBOutlet weak var mouseView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override  func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            self.yellowSquareView.center.x = self.view.bounds.width - self.yellowSquareView.center.x
            self.yellowSquareView.center.y = self.yellowSquareView.center.y + 30
            self.blueSquareView.center.x = self.view.bounds.width -  self.blueSquareView.center.x
            self.blueSquareView.center.y = self.blueSquareView.center.y + 30
            
        }, completion: nil )
        
        UIView.animate(withDuration: 0.6, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            self.setHeight(180)
            self.mouseView.center.y = self.view.bounds.height - self.mouseView.center.y
        }, completion: nil )
    }
    
    func setHeight(_ height: CGFloat) {
        
        var frame: CGRect = self.mouseView.frame
        frame.size.height = height
        
        self.mouseView.frame = frame
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
