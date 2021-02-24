//
//  HistoryViewController.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 5/5/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//


import UIKit

class HistoryViewController: UITableViewController {
    
    var testItems : [BoxItem]! = nil
    
    var boxArray : [Box]! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        self.tableView.register(UINib(nibName: "PastBoxCell", bundle: .main), forCellReuseIdentifier: PastBoxCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        createData()
    }
    
    
    func createData(){
        testItems = [BoxItem(name: "gloves", description: "rubber", favorite: false), BoxItem(name: "mask", description: "disposable", favorite: true), BoxItem(name: "medicine", description: "antibiotics", favorite: false)]
            
        boxArray = [Box(month: "January", year: 2020, items: testItems),
                                    Box(month: "February", year: 2020, items: testItems),
                                    Box(month: "March", year: 2020, items: testItems),
                                    Box(month: "April", year: 2020, items: testItems),
                                    Box(month: "May", year: 2020, items: testItems),
                                    Box(month: "June", year: 2020, items: testItems) ]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pastBoxCell", for: indexPath) as! PastBoxCell
        cell.label?.text = "\(boxArray[indexPath.row].month) \(boxArray[indexPath.row].year)"
        cell.imgView?.image = UIImage(named: "box")
        return cell
    }
    
}


