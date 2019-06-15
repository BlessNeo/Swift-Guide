//
//  AnimationCellModel.swift
//  CollectionViewAnimation
//
//  Created by BlessNeo on 2019/6/15.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import Foundation

struct AnimationCellModel {
    let imagePath: String
    
    init(imagePath: String?) {
        /*
         合并空值运算符 （ a ?? b ）如果可选项 a  有值则展开，如果没有值，是 nil  ，则返回默认值 b 。表达式 a 必须是一个可选类型。表达式 b  必须与 a  的储存类型相同。
         */
        self.imagePath = imagePath ?? ""
    }
}
