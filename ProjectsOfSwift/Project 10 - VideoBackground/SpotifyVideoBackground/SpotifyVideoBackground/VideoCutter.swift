//
//  VideoCutter.swift
//  SpotifyVideoBackground
//
//  Created by BlessNeo on 2019/6/4.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit
import AVFoundation

extension String {
    var convert: NSString { return (self as NSString) }
}

class VideoCutter: NSObject {

    func cropVideoWithUrl(videoURl url: URL, startTime: CGFloat, duration: CGFloat, completion: ((_ videoPath: URL?, _ error: NSError?) -> Void)?)  {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            let asset = AVURLAsset(url: url, options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
            var outputURL = paths.object(at: 0) as! String
            let manager = FileManager.default
            do {
                try manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true, attributes: nil)
            } catch _ {
                
            }
            outputURL = outputURL.convert.appendingPathComponent("output.mp4")
            do {
                try manager.removeItem(atPath: outputURL)
            } catch _ {
                
            }
            if let exportSession = exportSession as AVAssetExportSession? {
                exportSession.outputURL = URL(fileURLWithPath: outputURL)
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileType.mp4
                let start = CMTimeMakeWithSeconds(Float64(startTime), preferredTimescale: 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), preferredTimescale: 600)
                let range = CMTimeRangeMake(start: start, duration: duration)
                exportSession.timeRange = range
                exportSession.exportAsynchronously {
                    switch exportSession.status {
                    case AVAssetExportSession.Status.completed:
                        completion?(exportSession.outputURL, nil)
                    case AVAssetExportSession.Status.failed:
                    print("Failed: \(String(describing: exportSession.error))")
                    case AVAssetExportSession.Status.cancelled:
                    print("Failed: \(String(describing: exportSession.error))")
                    
                    default:
                    print("default case")
                }
                }
                
            }
        }
    }
}
