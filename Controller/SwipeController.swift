//
//  SwipeController.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 4/14/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit

class SwipeController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView!
        
    let pages = [
        Page(imageName: "Stay Home", headerText: "Don't even think about leaving your house."),
        Page(imageName: "Wash Hands", headerText: "20 second Minimum."),
        Page(imageName: "Wear Protective Gear", headerText: "Any skin not covered is at risk."),
    ]
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .blue
        pc.pageIndicatorTintColor = .purple
        return pc
    }()
    
    fileprivate func setupBottomControls() {
        let bottomControls = UIView()
        view.addSubview(bottomControls)
        bottomControls.addSubview(pageControl)
        bottomControls.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bottomControls.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControls.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControls.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControls.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        
        if pageControl.currentPage == 2{
            let cell = self.collectionView?.cellForItem(at: indexPath) as! PageCell
            cell.button.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.isPagingEnabled = true
        collectionView.reloadData()
        
        self.view.addSubview(collectionView)
        setupBottomControls()
    }
    
}
