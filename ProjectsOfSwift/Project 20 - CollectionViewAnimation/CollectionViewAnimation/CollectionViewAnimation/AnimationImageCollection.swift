
//
//  AnimationImageCollection.swift
//  CollectionViewAnimation
//
//  Created by BlessNeo on 2019/6/15.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import Foundation

struct AnimationImageCollection {
    private let imagePaths = ["1", "2", "3", "4", "5"]
    var images: [AnimationCellModel]
    
    init() {
        /*
         map
         Returns an array containing the results of mapping the given closure over the sequence’s elements.
         let cast = ["Vivien", "Marlon", "Kim", "Karl"]
         let lowercaseNames = cast.map { $0.lowercased() }
         // 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
         let letterCounts = cast.map { $0.count }
         // 'letterCounts' == [6, 6, 3, 4]
         */
        images = imagePaths.map { AnimationCellModel(imagePath: $0) }
    }
}
