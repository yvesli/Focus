//
//  ToDoTableViewCell.swift
//  Final_project
//
//  Created by evanlou on 12/6/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    
    
    var cellTitle: UILabel!
    var cellView: UIView!
//    var shapeLayer: CAShapeLayer!
    var circleImage: UIImageView!
    var checkImage: UIImageView!
    
    var mToDo: ToDo?
    
    let textFont: CGFloat = 18
    let padding: CGFloat = 5
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 0.8)
        cellView.layer.cornerRadius = 8
        contentView.addSubview(cellView)
        
        cellTitle = UILabel()
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.textColor = .white
        cellTitle.font = UIFont.systemFont(ofSize: textFont)
        cellTitle.sizeToFit()
        cellView.addSubview(cellTitle)
        
        circleImage = UIImageView(image: UIImage(named: "circle-white.png"))
        circleImage.isUserInteractionEnabled = true
        circleImage.backgroundColor = .clear
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        circleImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeTaskStatus)))
        cellView.addSubview(circleImage)
        
        checkImage = UIImageView(image: UIImage(named: "tick.png"))
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.isUserInteractionEnabled = true
        checkImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeTaskStatus)))
        checkImage.isHidden = true
        cellView.addSubview(checkImage)
        
//        shapeLayer = CAShapeLayer()
//        let center = CGPoint(x: 330, y: 40)
//        let circularPath = UIBezierPath(arcCenter: center, radius: 20, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: false)
//        shapeLayer.path = circularPath.cgPath
//        shapeLayer.strokeColor = UIColor.clear.cgColor
//        shapeLayer.lineWidth = 1
//        shapeLayer.fillColor = UIColor.white.cgColor
//        shapeLayer.strokeEnd = 0
//        cellView.layer.addSublayer(shapeLayer)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ]);
        NSLayoutConstraint.activate([
            cellTitle.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 4*padding),
            cellTitle.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 4*padding),
            cellTitle.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            cellTitle.heightAnchor.constraint(equalToConstant: 20)
        ]);
        NSLayoutConstraint.activate([
            circleImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -4*padding),
            circleImage.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            circleImage.widthAnchor.constraint(equalToConstant: 32),
            circleImage.heightAnchor.constraint(equalToConstant: 32)
        ]);
        NSLayoutConstraint.activate([
            checkImage.centerXAnchor.constraint(equalTo: circleImage.centerXAnchor),
            checkImage.centerYAnchor.constraint(equalTo: circleImage.centerYAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 26),
            checkImage.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
    
//    func configure(title: String) {
//        cellTitle.text = title
//    }
    
    func configure(toDo: ToDo) {
        cellTitle.text = toDo.mTitle
        mToDo = toDo
    }
    
    @objc func changeTaskStatus() {
        if checkImage.isHidden == true {
            checkImage.isHidden = false
            mToDo?.mfinished = true
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: cellTitle.text!)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cellTitle.attributedText = attributeString
        } else {
            checkImage.isHidden = true
            mToDo?.mfinished = false
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: cellTitle.text!)
            cellTitle.attributedText = attributeString
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
