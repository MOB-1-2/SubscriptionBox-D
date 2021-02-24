//
//  TitleCell.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 5/13/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit

class TitleCell: UICollectionViewCell {
    static var identifier: String = "TitleCell"
    
    @IBOutlet private var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func set(title: String) {
        lblTitle.text = title
    }
    
}

