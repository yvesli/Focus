//
//  SettingTableViewCell.swift
//  Final_project
//
//  Created by evanlou on 11/24/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    var cellTitle: UILabel!
    var iconImageView: UIImageView!
    
    let iconPadding: CGFloat = 30
    let titlePadding: CGFloat = 30
    let iconSize: CGFloat = 30

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellTitle = UILabel()
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.adjustsFontForContentSizeCategory = true
        cellTitle.textAlignment = .right
        cellTitle.sizeToFit()
        cellTitle.textColor = .black
        contentView.addSubview(cellTitle)
        
        iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: iconPadding),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: iconSize),
            iconImageView.widthAnchor.constraint(equalToConstant: iconSize)
        ]);
        
        NSLayoutConstraint.activate([
            cellTitle.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: titlePadding),
            cellTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellTitle.heightAnchor.constraint(equalToConstant: 24),
            cellTitle.widthAnchor.constraint(lessThanOrEqualToConstant: 300)
        ])
    }
    
    func configure(for tableItem: TableCellItem) {
        iconImageView.image = UIImage(named: tableItem.mIcon)
        cellTitle.text = tableItem.mTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
