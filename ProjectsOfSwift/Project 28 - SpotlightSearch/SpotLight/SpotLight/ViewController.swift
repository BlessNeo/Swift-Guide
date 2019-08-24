//
//  ViewController.swift
//  SpotLight
//
//  Created by BlessNeo on 2019/8/24.
//  Copyright © 2019 Swift. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrMovieInfo: NSMutableArray!
    var selectedMovieIndex: Int!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func loadMovieInfo() {
        if let path = Bundle.main.path(forResource: "MoviesData", ofType: "plist") {
            arrMovieInfo = NSMutableArray(contentsOfFile: path)
        }
    }
    
    func setupSearchableContent() {
        var searchableItems = [CSSearchableItem]()
        for i in 0...(arrMovieInfo.count - 1) {
            let movie = arrMovieInfo[i] as! [String: String]
            let searchableItemAttributeSet =
            CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            // set the title
            searchableItemAttributeSet.contentDescription = movie["Description"]!
            // set the image
            let imagePathParts = movie["Image"]!.components(separatedBy: ".")
            searchableItemAttributeSet.thumbnailURL =
            Bundle.main.url(forResource: imagePathParts[0], withExtension: imagePathParts[1])
            // set the description
            var keywords = [String]()
            let movieCategories = movie["Category"]!.components(separatedBy: ", ")
            for movieCategory in movieCategories {
                keywords.append(movieCategory)
            }
            let stars = movie["Stars"]!.components(separatedBy: ", ")
            for star in stars {
                keywords.append(star)
            }
            searchableItemAttributeSet.keywords = keywords
            let searchableItem = CSSearchableItem(uniqueIdentifier: "com.appcode.SpotIt.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            searchableItems.append(searchableItem)
            
            CSSearchableIndex.default().indexSearchableItems(searchableItems) {
                if $0 != nil {
                    print($0!.localizedDescription)
                }
            }
            
        }
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType {
            if let userInfo = activity.userInfo {
                let selectedMovie = userInfo[CSSearchableItemActivityIdentifier] as! String
                selectedMovieIndex = Int(selectedMovie.components(separatedBy: ".").last!)
                performSegue(withIdentifier: "idSegueShowMovieDetails", sender: self)
            }
        }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(UINib(nibName: "MovieSummaryCell", bundle: nil),
                           forCellReuseIdentifier: "idCellMovieSummary")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrMovieInfo != nil {
            return arrMovieInfo.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}

