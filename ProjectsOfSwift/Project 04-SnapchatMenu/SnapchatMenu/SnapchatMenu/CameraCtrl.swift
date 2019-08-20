//
//  CameraCtrl.swift
//  SnapchatMenu
//
//  Created by Egeo on 2018/11/1.
//  Copyright © 2018 Neo_ZH. All rights reserved.
//

import UIKit
import AVFoundation

class CameraCtrl: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var viewCamera: UIView!
    @IBOutlet weak var imgViewTemp: UIImageView!
    var captureSession: AVCaptureSession!
    var stillPhotoOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = viewCamera.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //这一部分知识官网介绍的很详细,是真的很详细
        //更新迭代很快
        //https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture
        //第一步当然是请求摄像头权限
        //If your app uses device cameras, include the NSCameraUsageDescription key in your app’s Info.plist file.
        //在 info.plist 文件中添加 Privacy - Camera Usage Description，"有了摄像头访问权限才能预览呐"
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        var error: NSError?
        var input: AVCaptureDeviceInput!
        if nil == backCamera {
            return
        }
        do {
            input = try AVCaptureDeviceInput(device: backCamera!)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        if nil == error && captureSession?.canAddInput(input) != false {
            captureSession?.addInput(input)
            //官网代码
            //https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture/setting_up_a_capture_session
//            let photoOutput = AVCapturePhotoOutput()
//            guard captureSession.canAddOutput(photoOutput) else { return }
//            captureSession.sessionPreset = .photo
//            captureSession.addOutput(photoOutput)
//            captureSession.commitConfiguration()
            
            stillPhotoOutput = AVCapturePhotoOutput()
            if captureSession?.canAddOutput(stillPhotoOutput) != false {
                captureSession?.addOutput(stillPhotoOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                viewCamera.layer.addSublayer(previewLayer)
                captureSession.startRunning()
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didPressTakeAnother()
    }
    var didTakePhoto = Bool()
    func didPressTakeAnother()  {
        if didTakePhoto == true {
            imgViewTemp.isHidden = true
            didTakePhoto = false
        } else {
            captureSession.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
        }
    }
    
    func didPressTakePhoto()  {
        if let videoConnection = stillPhotoOutput.connection(with: AVMediaType.video) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            let settings = AVCapturePhotoSettings()
            let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
            let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
                                 kCVPixelBufferWidthKey as String: 160,
                                 kCVPixelBufferHeightKey as String: 160]
            settings.previewPhotoFormat = previewFormat
            //拍照
            stillPhotoOutput?.capturePhoto(with: settings, delegate: self)
        }
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

extension CameraCtrl: AVCapturePhotoCaptureDelegate {
    //在这个方法里获取拍摄的图片
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        }
        let imageData = photo.fileDataRepresentation()
        if let data = imageData, let image = UIImage(data: data)  {
            print(image.size)
            imgViewTemp.image = image
            imgViewTemp.isHidden = false
            //之后可以进行把拍摄的图片保存到相册之类的操作，记得添加相应的隐私权限
        }
    }
}
