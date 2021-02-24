//
//  PastBox.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 5/15/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit

struct Box {
    let month: String
    let year: Int
    let items : [BoxItem]
}

struct BoxItem {
    let name: String
    let description: String
    let favorite: Bool
}
