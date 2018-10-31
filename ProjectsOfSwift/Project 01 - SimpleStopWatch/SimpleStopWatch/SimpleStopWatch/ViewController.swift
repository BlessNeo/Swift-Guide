//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by Egeo on 2018/10/31.
//  Copyright © 2018 Neo_ZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var lblTime: UILabel!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTime.text = String(counter)
    }

    @IBAction func btnResetPressed(_ sender: Any) {
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        lblTime.text = String(counter)
        btnPlay.isEnabled = true
        btnPause.isEnabled = true
    }
    
    @IBAction func btnPlayPressed(_ sender: Any) {
        if isPlaying {
            return
        }
        btnPlay.isEnabled = false
        btnPause.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(self.updateTimer),
                                     userInfo: nil,
                                     repeats: true)
        isPlaying = true
    }
    
    @IBAction func btnPausePressed(_ sender: Any) {
        btnPlay.isEnabled = true
        btnPause.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    //Swift 和 Objective-C 的互调
    @objc func updateTimer()  {
        counter += 0.1
        lblTime.text = String(format: "%.1f", counter)
    }
}

