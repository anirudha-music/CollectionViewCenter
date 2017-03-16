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
    @IBOutlet weak var textField: UITextField!
    
    var leftInset: CGFloat = 0.0
    var rightInset: CGFloat = 0.0
    var count = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshCollectionView(count)
    }
    
    func refreshCollectionView(count: Int) {
        print(count)
        let collectionViewHeight = collectionView.bounds.height
        let collectionViewWidth = collectionView.bounds.width
        let numberOfItemsThatCanInCollectionView = collectionViewWidth / collectionViewHeight
        if Int(numberOfItemsThatCanInCollectionView) > count {
            let totalCellWidth = collectionViewHeight * CGFloat(count)
            let totalSpacingWidth: CGFloat = CGFloat(count) * (CGFloat(count) - 1)
            leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2;
            rightInset = -leftInset
        } else {
            leftInset = 0.0
            rightInset = -collectionViewHeight
        }
        collectionView.reloadData()
    }
    
    @IBAction func refreshController(sender: AnyObject) {
        count = Int(textField.text ?? "0") ?? 0
        refreshCollectionView(count)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blueColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)
    }
}

