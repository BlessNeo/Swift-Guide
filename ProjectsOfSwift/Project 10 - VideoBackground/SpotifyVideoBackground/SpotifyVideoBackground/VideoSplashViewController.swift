//
//  VideoSplashViewController.swift
//  SpotifyVideoBackground
//
//  Created by BlessNeo on 2019/6/4.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}

class VideoSplashViewController: UIViewController {
    
    fileprivate let moviePlayer = AVPlayerViewController()
    fileprivate var moviePlayerSoundLevel: Float = 1.0
    var contentURL: URL? {
        didSet {
            if let _contentURL = contentURL {
                setMoviePlayer(_contentURL)
            }
        }
    }
    
    var videoFrame: CGRect = CGRect()
    var startTime: CGFloat = 0.0
    var duration: CGFloat = 0.0
    var backgroundColor: UIColor = UIColor.black {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    
    var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(VideoSplashViewController.playerItemDidReachEnd),
                                                       name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                       object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    var fillMode: ScalingMode = .resizeAspectFill {
        didSet {
            switch fillMode {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize
            case .resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect
            case .resizeAspectFill:
                moviePlayer.videoGravity =
                AVLayerVideoGravity.resizeAspectFill
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func setMoviePlayer(_ url: URL) {
        //VideoCutter 对视频进行编辑和压缩
        //不要VideoCutter也能正常播放视频
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoURl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as URL? {
                DispatchQueue.main.async {
                    self.moviePlayer.player = AVPlayer(url: path)
                    self.moviePlayer.player?.play()
                    self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func playerItemDidReachEnd() {
        //Sets the current playback time to the specified time.
        //播放完重新开始播放
        moviePlayer.player?.seek(to: CMTime.zero)
        moviePlayer.player?.play()
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
