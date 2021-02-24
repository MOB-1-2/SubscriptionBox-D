//
//  Section.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 5/13/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit

protocol Section {
    var numberOfItems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection?
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

