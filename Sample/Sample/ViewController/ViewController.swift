//
//  ViewController.swift
//  Sample
//
//  Created by Sonu Malik on 29/10/17.
//  Copyright © 2017 Sonu Malik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    let cellID = "cellID"
    var tagFileds = [
        "Depression",
        "Financial Issue",
        "Grief Issue",
        "Tag 1 and Tag 2",
        "More","tags",
        "and",
        "More","More","Tags","Like",
        "Financial Issue",
        "Grief","Depression",
        "Financial Issue",
        "Grief", "Extra"]
    
    let titleLabel : UILabel = {
        let label  = UILabel();
        label.text = "CollectionViewLeftAlignFlowLayout Sample..."
        label.font = .boldSystemFont(ofSize: 16);
        label.textColor = UIColor.black;
        label.textAlignment = .center
        return label;
    }();
    lazy var collectionView : UICollectionView  = {
        let flowLayout = CollectionViewLeftAlignFlowLayout()
        let collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flowLayout);
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        return collectionView;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(titleLabel);
        titleLabel.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40);
    
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: cellID);
        self.view.addSubview(collectionView);
        collectionView.anchor(self.titleLabel.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0);
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagFileds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TagCell
        cell.taglabel.text = tagFileds[indexPath.row]
        return cell;
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let estimatedSize = NSString.init(string: tagFileds[indexPath.row]).boundingRect(with: CGSize.init(width: self.view.frame.width - 40, height: 28), options: .usesLineFragmentOrigin, attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)
            ], context: nil)
        return CGSize(width: estimatedSize.width  + 20, height: 28);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 32);
    }
}

