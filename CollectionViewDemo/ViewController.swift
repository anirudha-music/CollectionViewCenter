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
        refreshCollectionView(count)
        textField.text = "3"
    }
    
    func refreshCollectionView(_ count: Int) {
        let collectionViewHeight = collectionView.bounds.height
        let collectionViewWidth = collectionView.bounds.width
        let numberOfItemsThatCanInCollectionView = Int(collectionViewWidth / collectionViewHeight)
        if numberOfItemsThatCanInCollectionView > count {
            let totalCellWidth = collectionViewHeight * CGFloat(count)
            let totalSpacingWidth: CGFloat = CGFloat(count) * (CGFloat(count) - 1)
            // leftInset, rightInset are the global variables which I am passing to the below function
            leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2;
            rightInset = -leftInset
        } else {
            leftInset = 0.0
            rightInset = -collectionViewHeight
        }
        collectionView.reloadData()
    }
    
    @IBAction func refreshController(_ sender: AnyObject) {
        count = Int(textField.text ?? "1") ?? 1
        refreshCollectionView(count)
        textField.resignFirstResponder()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)
    }
}

