    //
    //  HomeViewController.swift
    //  Subscription-Box
    //
    //  Created by Student Laptop_7/19_1 on 5/5/20.
    //  Copyright © 2020 Makeschool. All rights reserved.
    //
    
    import UIKit
    
    class HomeViewController: UIViewController {
        
        var collectionView: UICollectionView!
        
        lazy var sections: [Section] = [
            TitleSection(title: "Grid Example"),
            BasicGridSection(),
            TitleSection(title: "Featured Categories"),
            FeaturedSection(),
            TitleSection(title: "Last Month's Favorites"),
            FavoritesSection()
        ]
        
        
        lazy var collectionViewLayout: UICollectionViewLayout = {
            var sections = self.sections
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
                return sections[sectionIndex].layoutSection()
            }
            return layout
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Home"
            self.view.backgroundColor = UIColor.white
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .always
            setupCollectionView()
        }
        
        func setupCollectionView() {
            collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.backgroundColor = UIColor.white
            collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
            collectionView.register(UINib(nibName: "FeaturedCell", bundle: .main), forCellWithReuseIdentifier: FeaturedCell.identifier)
            collectionView.register(UINib(nibName: "FavoritesCell", bundle: .main), forCellWithReuseIdentifier: FavoritesCell.identifier)
            collectionView.register(UINib(nibName: "GridCell", bundle: .main), forCellWithReuseIdentifier: GridCell.identifier)
            self.view.addSubview(collectionView)
            collectionView.reloadData()
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            collectionView.reloadData()
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            collectionView.reloadData()
        }
    }
    
    extension HomeViewController: UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            sections.count
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            sections[section].numberOfItems
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
        }
    }
    
    extension HomeViewController: UICollectionViewDelegate {}
    
    
    
