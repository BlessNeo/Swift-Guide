//
//  MovieDetailViewController.swift
//  SpotLight
//
//  Created by BlessNeo on 2019/8/24.
//  Copyright © 2019 Swift. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblStars: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    var movieInfo: [String: String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
