//
//  DiscoverCollectionViewCell.swift
//  InFashion
//
//  Created by 庄小强 on 16/7/30.
//  Copyright © 2016年 zxq. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        imageView.backgroundColor = UIColor.blue()
    }
    
    override func layoutSubviews() {
        imageView.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
