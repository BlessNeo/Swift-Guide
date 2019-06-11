//
//  MenuTransitionManager.swift
//  SlideMenu
//
//  Created by BlessNeo on 2019/6/11.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

@objc protocol MenuTransitionManagerDelegate {
    func dismiss()
}

class MenuTransitionManager: NSObject {
    var duration = 0.5
    var isPresenting = false
    var delegate: MenuTransitionManagerDelegate?
    var snapshot: UIView? {
        didSet {
            if let _delegate = delegate {
                let tapGestureRecognizer = UITapGestureRecognizer(target: _delegate, action: #selector(MenuTransitionManagerDelegate.dismiss))
                snapshot?.addGestureRecognizer(tapGestureRecognizer)
            }
        }
    }

}

extension MenuTransitionManager: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!
        let container = transitionContext.containerView
        let moveLeft = CGAffineTransform(translationX: 250, y: 0)
        //let moveDown = CGAffineTransform(translationX: 0, y: 400)
        let moveRight = CGAffineTransform(translationX: 0, y: 0)
        if isPresenting {
            snapshot = fromView.snapshotView(afterScreenUpdates: true)
            //snapshot?.layer.borderColor = UIColor.red.cgColor
            //snapshot?.layer.borderWidth = 1.0
            container.addSubview(toView)
            container.addSubview(snapshot!)
        }
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            if self.isPresenting {
                self.snapshot?.transform = moveLeft
                toView.transform = .identity
            } else {
                self.snapshot?.transform = .identity
                fromView.transform = moveRight
            }
        }) { (finished) in
            transitionContext.completeTransition(true)
            if !self.isPresenting {
                self.snapshot?.removeFromSuperview()
            }
        }
    }
    
    
}

extension MenuTransitionManager: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
}
