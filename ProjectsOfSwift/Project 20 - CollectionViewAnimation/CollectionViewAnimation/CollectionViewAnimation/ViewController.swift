//
//  ViewController.swift
//  CollectionViewAnimation
//
//  Created by BlessNeo on 2019/6/15.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

extension Array {
    func safeIndex(_ i: Int) -> Element? {
        return i < self.count && i >= 0 ? self[i] : nil
    }
}

class ViewController: UIViewController {
    
    private struct Storyboard {
        static let CellIdentifier = "AnimationCollectionViewCell"
        static let NibName = "AnimationCollectionViewCell"
    }
    
    private struct Constants {
        static let AnimationDuration: Double = 0.5
        static let AnimationDelay: Double = 0.0
        static let AnimationSpringDamping: CGFloat = 1.0
        static let AnimationInitialSpringVelocity: CGFloat = 1.0
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageCollection: AnimationImageCollection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollection = AnimationImageCollection()
        collectionView.register(UINib(nibName: Storyboard.NibName, bundle: nil), forCellWithReuseIdentifier: Storyboard.CellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    private func handelAnimationCellSelected(_ collectionView: UICollectionView, cell: AnimationCollectionViewCell) {
        cell.handleCellSelected()
        cell.backButtonTapped = self.backButtonDidTouch
        //动画是有bug的，滚动collectionview后点击cell会导致cell位置错乱
        let animations = {
            cell.frame = self.view.bounds
        }
        let completion: (_ finashed: Bool) -> () = {
            _ in collectionView.isScrollEnabled = false
        }
        UIView.animate(withDuration: Constants.AnimationDuration, delay: Constants.AnimationDelay, usingSpringWithDamping: Constants.AnimationSpringDamping, initialSpringVelocity: Constants.AnimationInitialSpringVelocity, options: [], animations: animations, completion: completion)
        
    }
    
    func backButtonDidTouch() {
        guard let indexPaths = self.collectionView.indexPathsForSelectedItems else { return }
        collectionView.isScrollEnabled = true
        /*
         reloadItems(at:)
         Call this method to selectively reload only the specified items. This causes the collection view to discard any cells associated with those items and redisplay them.
         */
        collectionView.reloadItems(at: indexPaths)
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimationCollectionViewCell else { return  }
        self.handelAnimationCellSelected(collectionView, cell: cell)
    }
}

extension ViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollection.images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /*
         提前退出
         
         guard 语句，类似于 if 语句，基于布尔值表达式来执行语句。使用 guard 语句来要求一个条件必须是真才能执行 guard 之后的语句。与 if 语句不同， guard 语句总是有一个 else 分句—— else 分句里的代码会在条件不为真的时候执行。
         */
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as? AnimationCollectionViewCell, let viewModel = imageCollection.images.safeIndex(indexPath.item) else { return UICollectionViewCell() }
        cell.prepareCell(viewModel)
        return cell
    }
    
    
}

