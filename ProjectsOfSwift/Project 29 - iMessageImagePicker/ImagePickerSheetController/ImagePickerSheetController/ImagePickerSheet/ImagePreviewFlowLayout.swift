//
//  ImagePreviewFlowLayout.swift
//  ImagePickerSheetController
//
//  Created by BlessNeo on 2019/9/19.
//  Copyright © 2019 Swift. All rights reserved.
//

import UIKit

class ImagePreviewFlowLayout: UICollectionViewFlowLayout {

    var invalidationCenteredIndexPath: IndexPath?
    var showsSupplementaryViews : Bool = true {
        didSet {
            invalidateLayout()
        }
    }
    
    private var layoutAttributes = [UICollectionViewLayoutAttributes]()
    private var contentSize = CGSize.zero
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        scrollDirection = .horizontal
    }
    
    // MARK: - Layout
    override func prepare() {
        super.prepare()
        layoutAttributes.removeAll()
        contentSize = .zero
        if let collectionView = collectionView,
            let dataSource = collectionView.dataSource,
        let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout{
            var origin = CGPoint(x: sectionInset.left, y: sectionInset.top)
            /*
             合并空值运算符 （ a ?? b ）如果可选项 a 有值则展开，如果没有值，是 nil  ，则返回默认值 b 。表达式 a 必须是一个可选类型。表达式 b  必须与 a  的储存类型相同。
             合并空值运算符是下边代码的缩写：
             a != nil ? a! : b
             */
            let numberOfSections = dataSource.numberOfSections?(in: collectionView) ?? 0
            for s in 0 ..< numberOfSections {
                let indexPath = IndexPath(row: 0, section: s)
                let size = delegate.collectionView?(collectionView, layout: self, sizeForItemAt: indexPath) ?? .zero
            }
        }
    }
}
