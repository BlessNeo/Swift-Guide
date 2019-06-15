//
//  PatternCell.swift
//  SwipeableCell
//
//  Created by BlessNeo on 2019/6/15.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

struct Pattern {
    let image: String
    let name: String
}

class PatternCell: UITableViewCell {

    @IBOutlet weak var labTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
