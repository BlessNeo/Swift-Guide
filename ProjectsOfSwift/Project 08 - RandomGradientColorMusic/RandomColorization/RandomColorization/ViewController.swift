//
//  ViewController.swift
//  RandomColorization
//
//  Created by BlessNeo on 2019/6/3.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    let gradientLayer = CAGradientLayer()
    var timer: Timer?
    var backgroundColor: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)! {
        didSet {
            //两个颜色如果一样还怎么过渡
            let color1 = UIColor(red: backgroundColor.red,
                                 green: backgroundColor.green,
                                 blue: 0,
                                 alpha: backgroundColor.alpha).cgColor
            let color2 = UIColor(red: backgroundColor.red,
                                 green: backgroundColor.green,
                                 blue: backgroundColor.blue,
                                 alpha: backgroundColor.alpha).cgColor
            gradientLayer.colors = [color1, color2]
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //废弃
        /*
         Setter for 'isStatusBarHidden' was deprecated in iOS 9.0: Use -[UIViewController prefersStatusBarHidden]
         */
       // UIApplication.shared.isStatusBarHidden = true
    }
    //info.plist中设置 View controller-based status bar appearance 为 YES 才会触发
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func playMusicButtonDidTouch(_ sender: AnyObject) {
        //play bg music
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy",
                                                            ofType: "mp3")!)
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
            audioPlayer.prepareToPlay()
            /*
             Calling this method implicitly calls the prepareToPlay() method if the audio player is not already prepared to play.
             */
            audioPlayer.play()
            
        } catch let audioError as NSError {
            print(audioError)
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.1,
                                         target: self,
                                         selector: #selector(ViewController.randomColor),
                                         userInfo: nil,
                                         repeats: true)
        }
        
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue,
                                            green: greenValue,
                                            blue: blueValue,
                                            alpha: 1.0)
        //graditent color
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    @objc func randomColor() {
        /**
         srand48 和 drand48 是两个库函数。
         srand48 的作用是初始化 drand48 函数
         drand48 函数是生成 [0,1]之间均匀分布的随机数
         
         */
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        backgroundColor = (redValue, blueValue, greenValue, 1)
    }


}

