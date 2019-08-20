//
//  ViewController.swift
//  SnapchatMenu
//
//  Created by Egeo on 2018/11/1.
//  Copyright © 2018 Neo_ZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let ctrlLeft: LeftCtrl = LeftCtrl(nibName: "LeftCtrl", bundle: nil)
        self.addChild(ctrlLeft)
        scrollView.addSubview(ctrlLeft.view)
        ctrlLeft.didMove(toParent: self)
        
        let ctrlCamera: CameraCtrl = CameraCtrl(nibName: "CameraCtrl", bundle: nil)
        self.addChild(ctrlCamera)
        scrollView.addSubview(ctrlCamera.view)
        ctrlCamera.didMove(toParent: self)
        
        let ctrlRight: RightCtrl = RightCtrl(nibName: "RightCtrl", bundle: nil)
        self.addChild(ctrlRight)
        scrollView.addSubview(ctrlRight.view)
        ctrlRight.didMove(toParent: self)
        
        var cameraCtrlFrame: CGRect = ctrlCamera.view.frame
        cameraCtrlFrame.origin.x = self.view.frame.width
        ctrlCamera.view.frame = cameraCtrlFrame
        
        var rightCtrlFrame: CGRect = ctrlRight.view.frame
        rightCtrlFrame.origin.x = 2 * self.view.frame.width
        ctrlRight.view.frame = rightCtrlFrame
        
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: self.view.frame.width * 3,
                                        height: self.view.frame.height)
        
    }


}

