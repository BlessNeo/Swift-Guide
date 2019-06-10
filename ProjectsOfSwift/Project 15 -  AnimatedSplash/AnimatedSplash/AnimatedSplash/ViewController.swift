//
//  ViewController.swift
//  AnimatedSplash
//
//  Created by BlessNeo on 2019/6/10.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    var mask: CALayer?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         https://medium.com/@JJeremy.XUE/玩玩-遮罩-mask-93597a9f0f5
         */
        self.mask = CALayer()
        
        self.mask?.contents = UIImage(named: "twitter")?.cgImage
        self.mask?.contentsGravity = CALayerContentsGravity.resizeAspect
        self.mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        //锚点，这里是中心点
        //You specify the value for this property using the unit coordinate space. The default value of this property is (0.5, 0.5), which represents the center of the layer’s bounds rectangle.
        self.mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.imgView.setNeedsLayout()
        self.imgView.layoutIfNeeded()
        //self.mask?.position = CGPoint(x: self.imgView.frame.size.width / 2, y: self.imgView.frame.size.height / 2)
        self.mask?.position = self.view.center
        //self.mask?.borderColor = UIColor.red.cgColor
        //self.mask?.borderWidth = 2.0
        //self.mask?.backgroundColor = UIColor.black.cgColor
        self.imgView.layer.mask = self.mask
        animateMask()
    }
    
    func animateMask() {
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        print("时间：\(CACurrentMediaTime())")
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 1.0
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)]
        do {
            //动画需要加上这段代码，否则会造成页面闪一下
            keyFrameAnimation.fillMode = CAMediaTimingFillMode.forwards
            keyFrameAnimation.isRemovedOnCompletion = false
        }
        let initalBounds = NSValue(cgRect: self.mask!.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90*0.9, height: 73*0.9))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        self.mask?.add(keyFrameAnimation, forKey: "bounds")
    }


}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.imgView.layer.mask = nil
    }
}

