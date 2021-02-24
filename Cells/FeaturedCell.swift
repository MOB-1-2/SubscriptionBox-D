//
//  FeaturedCell.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 5/13/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    static var identifier: String = "FeaturedCell"
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        imgView.layer.cornerRadius = 10
        textLabel.text = "random"
    }
}

