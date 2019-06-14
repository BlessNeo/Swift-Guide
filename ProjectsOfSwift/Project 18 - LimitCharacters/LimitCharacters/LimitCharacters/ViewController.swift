//
//  ViewController.swift
//  LimitCharacters
//
//  Created by BlessNeo on 2019/6/13.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var bottomUIView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.layer.borderColor = UIColor.white.cgColor
        tweetTextView.layer.borderWidth = 0.5
        tweetTextView.layer.cornerRadius = 5.0
        tweetTextView.delegate = self
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        tweetTextView.backgroundColor = UIColor.clear
        //添加键盘状态监听
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //点击页面空白处收起键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //键盘通知响应事件处理
    //键盘即将出现
    @objc func keyBoardWillShow(_ note: NSNotification) {
        let userInfo = note.userInfo
        /*
         keyboardFrameEndUserInfoKey
         The key for an NSValue object containing a CGRect that identifies the ending frame rectangle of the keyboard in screen coordinates. The frame rectangle reflects the current orientation of the device.
         */
        let keyBoardBounds = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltaY = keyBoardBounds.size.height
        //一个 ()->() 的函数(闭包,block) ()->Void
        let animations = {
            //将下方视图上移一个键盘高度
            self.bottomUIView.transform = CGAffineTransform(translationX: 0, y: -deltaY)
        }
        if duration > 0 {
            UIView.animate(withDuration: duration, delay: 0, options: [.beginFromCurrentState, .curveLinear], animations: animations, completion: nil)
            /*
            UIView.animateKeyframes(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, options: <#T##UIView.KeyframeAnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
             */
        } else {
            animations()
        }
    }
    //键盘即将隐藏
    @objc func keyBoardWillHide(_ note: NSNotification) {
        let userInfo  = note.userInfo
        let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        //恢复原状
        let animations = {
            self.bottomUIView.transform = .identity
        }
        
        if duration > 0 {
            UIView.animate(withDuration: duration, delay: 0, options:[.beginFromCurrentState, .curveLinear], animations: animations, completion: nil)
        }else{
            animations()
        }
    }


}

extension ViewController: UITextViewDelegate {
    /*
     Asks the delegate whether the specified text should be replaced in the text view.
     textView:要替换之前的textview
     text:要替换的字符串
     range:当前选择的range，比如cut 及 delete的字符串范围
     The current selection range. If the length of the range is 0, range reflects the current insertion point. If the user presses the Delete key, the length of the range is 1 and an empty string object replaces that single character.
     */
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        /*
         https://stackoverflow.com/questions/2492247/limit-number-of-characters-in-uitextview/4289410
         */
        
        let inputTextLength = text.count - range.length + tweetTextView.text.count
        print("range:\(range),text:\(text),text.count:\(text.count),textView.text.count:\(tweetTextView.text.count),inputTextLength:\(inputTextLength)")
        if inputTextLength > 140 {
            return false
        }
        characterCountLabel.text = "\(140 - inputTextLength)"
        return true
    }
}

