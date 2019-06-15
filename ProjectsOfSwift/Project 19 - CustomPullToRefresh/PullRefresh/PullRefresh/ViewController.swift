//
//  ViewController.swift
//  PullRefresh
//
//  Created by BlessNeo on 2019/6/14.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: UIRefreshControl!
    var customView: UIView!
    var labelArray: Array<UILabel> = []
    var isAnimating = false
    var currentColorIndex = 0
    var currentLableIndex = 0
    var timer: Timer!
    var dataArray: Array<String> = ["😂", "🤗", "😳", "😌", "😊"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.tintColor = UIColor.clear
        tableView.addSubview(refreshControl)
        loadCustomRefreshContens()
    }
    
    func loadCustomRefreshContens() {
        let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)
        customView = refreshContents![0] as? UIView
        customView.frame = refreshControl.bounds
        for i in 0..<customView.subviews.count {
            labelArray.append(customView.viewWithTag(i + 1) as! UILabel)
        }
        refreshControl.addSubview(customView)
    }
    
    func animateRefreshStep1() {
        isAnimating = true
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveLinear, animations: {
            //旋转
            self.labelArray[self.currentLableIndex].transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
            //颜色
            self.labelArray[self.currentLableIndex].textColor = self.getNextColor()
            
        }) { (_) in
            UIView.animate(withDuration: 0.05, delay: 0.0, options: .curveLinear, animations: {
                //恢复原状
               
                self.labelArray[self.currentLableIndex].transform = .identity
                self.labelArray[self.currentLableIndex].textColor = UIColor.black
            }, completion: { (_) in
                self.currentLableIndex += 1
                if self.currentLableIndex < self.labelArray.count {
                    //还没有走一遍，继续动画步骤1
                    self.animateRefreshStep1()
                } else {
                    //走完了走动画步骤2
                    self.animateRefreshStep2()
                }
            })
        }
    }
    
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
            //放大
            let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
            for lable in self.labelArray {
                lable.transform = scale
            }
        }) { (_) in
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: {
                //恢复原状
                for lable in self.labelArray {
                    lable.transform = .identity
                }
            }, completion: { (_) in
                //如果刷新状态还未结束，动画重新开始一遍
                if self.refreshControl.isRefreshing {
                    self.currentLableIndex = 0
                    self.animateRefreshStep1()
                } else {
                    //刷新状态结束，动画结束
                    self.isAnimating = false
                    self.currentLableIndex = 0
                    for lable in self.labelArray {
                        lable.textColor = UIColor.black
                        lable.transform = .identity
                    }
                }
            })
        }
    }
    
    func getNextColor() -> UIColor {
        var colorsArray: Array<UIColor> = [.magenta, .brown, .yellow,
                                            .red, .green, .blue, .orange]
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1
        return returnColor
    }
    
    func doSomething() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.endedOfWork), userInfo: nil, repeats: true)
    }
    
    @objc func endedOfWork() {
        //结束刷新状态
        refreshControl.endRefreshing()
        //注销计时器
        timer.invalidate()
        timer = nil
    }


}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshControl.isRefreshing {
            if !isAnimating {
                doSomething()
                animateRefreshStep1()
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    
}

