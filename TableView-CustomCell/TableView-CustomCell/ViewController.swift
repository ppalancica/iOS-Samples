//
//  ViewController.swift
//  TableView-CustomCell
//
//  Created by Pavel Palancica on 1/2/19.
//  Copyright © 2019 I Dev TV. All rights reserved.
//

import UIKit

let cellId = String(describing: PersonTableViewCell.self)

class ViewController: UIViewController {
    
    private var personItems: [PersonData] = [
        PersonData(firstName: "Pavel", lastName: "Palancica", yearOfBirth: 1990),
        PersonData(firstName: "Andreea", lastName: "Mihaila", yearOfBirth: 1983),
        PersonData(firstName: "Ahmad", lastName: "Tabibi", yearOfBirth: 1987)
    ]
    
    lazy var peopleTableView: UITableView = {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let tableViewFrame = CGRect(x: 0,
                                    y: statusBarHeight,
                                    width: view.bounds.size.width,
                                    height: view.bounds.size.height - statusBarHeight)
        
        let tempTableView = UITableView(frame: tableViewFrame, style: .plain)
        
        tempTableView.register(PersonTableViewCell.self, forCellReuseIdentifier: cellId)
        tempTableView.dataSource = self
        tempTableView.delegate = self
        
        return tempTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(peopleTableView)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PersonTableViewCell
        let person = personItems[indexPath.row]
        
        cell.firstNameLabel.text = person.firstName
        cell.lastNameLabel.text = person.lastName
        cell.yearOfBirthLabel.text = String(person.yearOfBirth)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected row: \(indexPath.row)")
        let person = personItems[indexPath.row]
        print("Selected person: \(person)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
