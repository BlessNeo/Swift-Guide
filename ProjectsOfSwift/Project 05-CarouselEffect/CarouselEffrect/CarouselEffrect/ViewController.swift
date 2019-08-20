//
//  ViewController.swift
//  CarouselEffrect
//
//  Created by Egeo on 2018/11/2.
//  Copyright © 2018 Neo_ZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var arrInterests = Interest.createInterests()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrInterests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestListCell",
                                                      for: indexPath) as! InterestListCell
        if arrInterests.count > indexPath.row {
            cell.interest = arrInterests[indexPath.row]
        }
        return cell
    }
    
    
}

