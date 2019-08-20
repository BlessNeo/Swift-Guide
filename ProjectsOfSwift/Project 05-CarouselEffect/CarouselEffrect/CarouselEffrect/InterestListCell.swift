//
//  InterestListCell.swift
//  CarouselEffrect
//
//  Created by Egeo on 2018/11/2.
//  Copyright © 2018 Neo_ZH. All rights reserved.
//

import UIKit

class InterestListCell: UICollectionViewCell {
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    fileprivate func updateUI()  {
        lblTitle.text = interest.title
        imgView.image = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
}
