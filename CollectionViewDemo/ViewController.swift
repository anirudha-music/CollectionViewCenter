//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by LA Argon on 15/03/17.
//  Copyright © 2017 LA Argon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blueColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let totalCellWidth = collectionView.bounds.height * 10
        let totalSpacingWidth: CGFloat = 10 * (10 - 1)
        
        let leftInset = (collectionView.bounds.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2;
        let rightInset = leftInset

        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)
    }
}

