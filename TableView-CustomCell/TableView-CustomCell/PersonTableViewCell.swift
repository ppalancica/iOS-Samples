//
//  PersonTableViewCell.swift
//  TableView-CustomCell
//
//  Created by Pavel Palancica on 1/2/19.
//  Copyright © 2019 I Dev TV. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    var firstNameLabel: UILabel
    var lastNameLabel: UILabel
    var yearOfBirthLabel: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        var labelFrame = CGRect(x: 20, y: 10, width: UIScreen.main.bounds.size.width - 40, height: 30)
        firstNameLabel = UILabel(frame: labelFrame)
        
        labelFrame.origin = CGPoint(x: 20, y: labelFrame.origin.y + 40)
        lastNameLabel = UILabel(frame: labelFrame)
        
        labelFrame.origin = CGPoint(x: 20, y: labelFrame.origin.y + 40)
        yearOfBirthLabel = UILabel(frame: labelFrame)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(lastNameLabel)
        contentView.addSubview(yearOfBirthLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
