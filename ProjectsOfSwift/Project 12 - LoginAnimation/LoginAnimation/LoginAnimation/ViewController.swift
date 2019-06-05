//
//  ViewController.swift
//  LoginAnimation
//
//  Created by BlessNeo on 2019/6/5.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txfUserName: UITextField!
    @IBOutlet weak var txfPsw: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var consTxfUserNameCenter: NSLayoutConstraint!
    @IBOutlet weak var consTxfPswCenter: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        txfUserName.layer.cornerRadius = 5.0
        txfPsw.layer.cornerRadius = 5.0
        txfUserName.delegate = self
        txfPsw.delegate = self
        btnLogin.layer.cornerRadius = 5.0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        consTxfUserNameCenter.constant -= view.bounds.width
        consTxfPswCenter.constant -= view.bounds.width
        btnLogin.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.00, options: .curveEaseOut, animations: {
            self.consTxfUserNameCenter.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.10, options: .curveEaseOut, animations: {
            self.consTxfPswCenter.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.20, options: .curveEaseOut, animations: {
            
           self.btnLogin.alpha = 1.0
        }, completion: nil)
    }

    @IBAction func loginButtonDidTouch(_ sender: Any) {
        let bounds = self.btnLogin.bounds
        //Animate
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: .curveLinear, animations: {
            self.btnLogin.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
                        self.btnLogin.isEnabled = false
        }) { (finished) in
            self.btnLogin.isEnabled = true
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

