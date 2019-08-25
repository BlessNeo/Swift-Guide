//
//  MovieSummaryCell.swift
//  SpotLight
//
//  Created by BlessNeo on 2019/8/24.
//  Copyright © 2019 Swift. All rights reserved.
//

import UIKit

class MovieSummaryCell: UITableViewCell {
    
    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblRating: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        lblRating.layer.cornerRadius = lblRating.frame.size.width/2
        lblRating.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
