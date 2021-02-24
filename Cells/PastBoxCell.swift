//
//  ContactCell.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 5/15/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit

class PastBoxCell: UITableViewCell {
    
    static var identifier: String = "pastBoxCell"

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    //Cell initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        /*self.contentView.addSubview(background)
        background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true*/
    }
    
    
    let background : UIView = {
        let background = UIView()
        background.backgroundColor = #colorLiteral(red: 50, green: 115, blue: 220, alpha: 0.3)
        background.layer.cornerRadius = 5
        background.layer.masksToBounds = true
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    

    
}
