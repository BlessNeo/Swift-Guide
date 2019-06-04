//
//  ViewController.swift
//  SpotifyVideoBackground
//
//  Created by BlessNeo on 2019/6/4.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
    }

    func setupVideoBackground() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        //从第2秒开始截取视频
        startTime = 1.0
        //视频截取长度
        duration = 15.0
        alpha = 0.8
        contentURL = url
    }

}

