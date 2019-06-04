//
//  ViewController.swift
//  ImageScrollerEffect
//
//  Created by BlessNeo on 2019/6/3.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgLeftCons: NSLayoutConstraint!
    @IBOutlet weak var imgBottomCons: NSLayoutConstraint!
    @IBOutlet weak var imgTopCons: NSLayoutConstraint!
    @IBOutlet weak var imgRightCons: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    //计算scrollview的缩放比例，缩放比例为1表示内容正常大小显示，缩放比例小于1表示容器内的内容缩小，缩放比例大于1表示放大容器内的内容
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize)
    {
        //要获得最小的缩放比例，首先计算所需的缩放比例，以便根据其宽度在scrollview中紧贴imageview
        let widthScale = size.width / imgView.bounds.width
        let heightScale = size.height / imgView.bounds.height
        //选取宽度和高度比例中最小的那个，设置为minimumZoomScale
        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintForSize(view.bounds.size)
    }
    //当scrollview的内容大小小于边界时，内容放置在左上角而不是中心，updateConstraintForSize方法处理这个问题，通过调整图像视图的布局约束
    fileprivate func updateConstraintForSize(_ size: CGSize)
    {
        //将图像垂直居中，从视图高度减去image view的高度并分成两半，这个值用作顶部和底部image view的约束
        let yOffset = max(0, (size.height - imgView.frame.height) / 2)
        imgTopCons.constant = yOffset
        imgBottomCons.constant = yOffset
        //根据宽度计算image view前后约束的偏移量
        let xOffset = max(0, (size.width - imgView.frame.width) / 2)
        imgLeftCons.constant = xOffset
        imgRightCons.constant = yOffset
        print("y:\(yOffset)")
        print("x:\(xOffset)")
        view.layoutIfNeeded()
    }
    
    //每次控制器更新其子视图时更新最小缩放比例
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //当手势动作发生时，scrollview告诉控制器要放大或缩小子视图image view
        return imgView
    }

}

