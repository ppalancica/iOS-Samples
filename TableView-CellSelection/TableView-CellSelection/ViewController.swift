//
//  ViewController.swift
//  TableView-CellSelection
//
//  Created by Pavel Palancica on 1/2/19.
//  Copyright © 2019 I Dev TV. All rights reserved.
//

import UIKit

let cellId = String(describing: UITableViewCell.self)

class ViewController: UIViewController {
    
    var numbers = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    
    lazy var numbersTableView: UITableView = {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let tableViewFrame = CGRect(x: 0,
                                    y: statusBarHeight,
                                    width: view.bounds.size.width,
                                    height: view.bounds.size.height - statusBarHeight)
        
        let tempTableView = UITableView(frame: tableViewFrame, style: .plain)
        
        tempTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tempTableView.dataSource = self
        tempTableView.delegate = self
        
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
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let number = numbers[indexPath.row]
        
        cell.textLabel?.text = String(number)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected row: \(indexPath.row)")
        print("Selected value: " + String(numbers[indexPath.row]))
    }
}
