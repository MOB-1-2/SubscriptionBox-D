//
//  TabBarViewController.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 5/5/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        setupTabBarViews()
    }
    
    func setupTabBarViews(){
        
        let homeVC = HomeViewController()
        let homeVCIcon = UIImage(systemName: "house")
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: homeVCIcon, tag: 0)
        
        let newVC = NewViewController()
        let newVCIcon = UIImage(systemName: "shippingbox")
        newVC.tabBarItem = UITabBarItem(title: "New", image: newVCIcon, tag: 1)
        
        let historyVC = HistoryViewController()
        let historyVCIcon = UIImage(systemName: "clock")
        historyVC.tabBarItem = UITabBarItem(title: "History", image: historyVCIcon, tag: 2)
        
        let profileVC = ProfileViewController()
        let profileVCIcon = UIImage(systemName: "person.crop.circle")
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: profileVCIcon, tag: 3)
        
        let views = [homeVC, newVC, historyVC, profileVC]
        viewControllers = views.map{
            let navigationController = UINavigationController(rootViewController: $0)
            
            return navigationController
        }
        self.selectedIndex = 0
    }
}

extension UIImage {
    func scaled(with scale: CGFloat) -> UIImage? {
        // size has to be integer, otherwise it could get white lines
        let size = CGSize(width: floor(self.size.width * scale), height: floor(self.size.height * scale))
        UIGraphicsBeginImageContext(size)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}


