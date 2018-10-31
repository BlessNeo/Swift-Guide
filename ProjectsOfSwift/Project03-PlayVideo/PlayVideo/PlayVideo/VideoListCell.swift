//
//  VideoListCell.swift
//  PlayVideo
//
//  Created by Egeo on 2018/10/31.
//  Copyright © 2018 Neo_ZH. All rights reserved.
//

import UIKit

struct Video {
    let image: String
    let title: String
    let source: String
    
}

class VideoListCell: UITableViewCell {
    @IBOutlet weak var imgList: UIImageView!
    
    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
