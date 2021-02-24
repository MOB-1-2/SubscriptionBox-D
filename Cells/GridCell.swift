//
//  GridCell.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 5/13/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    static var identifier: String = "GridCell"
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        
    }
    func setup() {
        mainView.layer.cornerRadius = 10.0
    }
}
