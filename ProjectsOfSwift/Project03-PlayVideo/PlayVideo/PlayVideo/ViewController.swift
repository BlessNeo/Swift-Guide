//
//  ViewController.swift
//  PlayVideo
//
//  Created by Egeo on 2018/10/31.
//  Copyright © 2018 Neo_ZH. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    var arrData = [
        
        Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        Video(image: "videoScreenshot01", title: "Adventure Time", source: "Youtube - 02:39"),
        Video(image: "videoScreenshot02", title: "Facebook HQ", source: "Facebook - 10:20"),
        Video(image: "videoScreenshot03", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    
    var ctrlPlay = AVPlayerViewController()
    var viewPlayer = AVPlayer()
    
    @IBOutlet weak var tableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnPlayVideoPressed(_ sender: Any) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        viewPlayer = AVPlayer(url: URL(fileURLWithPath: path!))
        ctrlPlay.player = viewPlayer
        self.present(ctrlPlay, animated: true) {
            self.ctrlPlay.player?.play()
        }
    }
}

//MARK:- UIViewTableView DataSource & Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListCell", for: indexPath) as! VideoListCell
        if arrData.count > indexPath.row {
            let video = arrData[indexPath.row]
            cell.imgList.image = UIImage(named: video.image)
            cell.lblTitle.text = video.title
            cell.lblSource.text = video.source
        }
        return cell
    }
    
    
}

