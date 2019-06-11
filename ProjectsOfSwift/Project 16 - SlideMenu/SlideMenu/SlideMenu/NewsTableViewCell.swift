//
//  NewsTableViewCell.swift
//  SlideMenu
//
//  Created by BlessNeo on 2019/6/11.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAuthor: UIImageView!
    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var labTitle: UILabel!
    @IBOutlet weak var labAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgAuthor.layer.cornerRadius = imgAuthor.bounds.height / 2.0
        imgAuthor.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
