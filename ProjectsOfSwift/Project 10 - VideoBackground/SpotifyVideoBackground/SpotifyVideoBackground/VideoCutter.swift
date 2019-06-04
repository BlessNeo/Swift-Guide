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

//这个文件在好多地方都看到了，最初的作者叫Toygar Dündaralp
class VideoCutter: NSObject {

    /// Block based method for crop video url
    /// 对视频进行压缩 截取
    ///
    /// - Parameters:
    ///   - url: video url
    ///   - startTime: the starting point of video segments
    ///   - duration: total time, video length
    ///   - completion: block
    func cropVideoWithUrl(videoURl url: URL,
                          startTime: CGFloat,
                          duration: CGFloat,
                          completion: ((_ videoPath: URL?, _ error: NSError?) -> Void)?)
    {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            //获取媒体资源
            let asset = AVURLAsset(url: url, options: nil)
            //使用AVAssetExportSession进行简单的编辑
            //An object that transcodes the contents of an asset source object to create an output of the form described by a specified export preset.
            let exportSession = AVAssetExportSession(asset: asset,
                                                     presetName: "AVAssetExportPresetHighestQuality")
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
                //输出URL
                exportSession.outputURL = URL(fileURLWithPath: outputURL)
                //优化网络
                exportSession.shouldOptimizeForNetworkUse = true
                ////转换后的格式
                exportSession.outputFileType = AVFileType.mp4
                //截取视频，从 startTime 开始截取
                let start = CMTimeMakeWithSeconds(Float64(startTime), preferredTimescale: 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), preferredTimescale: 600)
                //The duration parameter must have an epoch of 0; otherwise an invalid time range will be returned.
                let range = CMTimeRangeMake(start: start, duration: duration)
                exportSession.timeRange = range
                //异步导出
                exportSession.exportAsynchronously {
                    switch exportSession.status {
                    case AVAssetExportSession.Status.completed:
                        //转换完成
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
