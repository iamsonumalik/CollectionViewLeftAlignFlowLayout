//
//  TagCell.swift
//  Sample
//
//  Created by Sonu Malik on 29/10/17.
//  Copyright © 2017 Sonu Malik. All rights reserved.
//
import UIKit
class TagCell: UICollectionViewCell {
    lazy var parentView : UIView = {
        let parentView = UIView();
        parentView.backgroundColor = UIColor.init(red: 35/255, green: 51/255, blue: 68/255 , alpha : 1)
        parentView.layer.cornerRadius = 14;
        parentView.clipsToBounds = true;
        
        parentView.addSubview(taglabel);
        taglabel.anchorCenterSuperview();
        
        return parentView;
    }()
    
    
    let taglabel : UILabel = {
        let label = UILabel();
        label.textColor = .white;
        label.font = .systemFont(ofSize: 12);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        addLabelView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLabelView(){
        self.addSubview(parentView);
        parentView.fillSuperview();
    }
    
}
