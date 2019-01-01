//
//  ViewController.swift
//  TableView-Basic
//
//  Created by Pavel Palancica on 1/1/19.
//  Copyright © 2019 I Dev TV. All rights reserved.
//

import UIKit

let cellId = String(describing: UITableViewCell.self)

class ViewController: UIViewController {
    
    var numberItems = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    lazy var numbersTableView: UITableView = {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let tableViewFrame = CGRect(x: 0,
                                    y: statusBarHeight,
                                    width: view.bounds.size.width,
                                    height: view.bounds.size.height - statusBarHeight)
        
        let tempTableView = UITableView(frame: tableViewFrame, style: .plain)
        
        tempTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tempTableView.dataSource = self
        
        return tempTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(numbersTableView)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let number = numberItems[indexPath.row]
        
        cell.textLabel?.text = String(number)
        
        return cell
    }
}
