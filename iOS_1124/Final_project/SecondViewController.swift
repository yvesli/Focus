//
//  SecondViewController.swift
//  Final_project
//
//  Created by evanlou on 11/6/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
//    let shapeLayer = CAShapeLayer()
//    var countdownLabel: UILabel!
    
    var navBtn: UIBarButtonItem!

//    var timeLeft = 120;
//    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "second view"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
//        let circularPath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: -0.49*CGFloat.pi, clockwise: false)
//        shapeLayer.path = circularPath.cgPath
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        shapeLayer.lineWidth = 10
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineCap = .round
//        shapeLayer.strokeEnd = 1
//        view.layer.addSublayer(shapeLayer)
//
//        countdownLabel = UILabel()
//        countdownLabel.translatesAutoresizingMaskIntoConstraints = false
//        countdownLabel.text = "Start"
//        countdownLabel.textAlignment = .center
//        countdownLabel.textColor = .black
//        countdownLabel.font = UIFont.systemFont(ofSize: 30)
//        view.addSubview(countdownLabel)
//
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(beginTimer)))
////        UINavigationBar.appearance().backgroundColor = .red
////        navBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
////        navigationItem.rightBarButtonItem = navBtn
//        setUpConstraints()
    }
    
//    @objc func beginTimer() {
//        print("1")
//        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        basicAnimation.toValue = 0
//        basicAnimation.duration = 120
//        basicAnimation.fillMode = .forwards
//        basicAnimation.isRemovedOnCompletion = true
//
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
//        shapeLayer.add(basicAnimation, forKey: "")
//    }
//
//    @objc func updateCountdown() {
//        timeLeft -= 1
//
//        var min: String
//        if (timeLeft/60 == 0) {
//            min = "00"
//        } else if (timeLeft/60 < 10) {
//            min = "0\(timeLeft/60)"
//        } else {
//            min = "\(timeLeft/60)"
//        }
//
//        var sec: String
//        if (timeLeft%60 < 10) {
//            sec = "0\(timeLeft%60)"
//        } else {
//            sec = "\(timeLeft%60)"
//        }
//
//        if (timeLeft <= 0) {
//            min = "00"
//            sec = "00"
//            timer?.invalidate()
//            timer = nil
//        }
//        countdownLabel.text = min + ":" + sec
//    }
    
//    func setUpConstraints() {
//        NSLayoutConstraint.activate([
//            countdownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            countdownLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            countdownLabel.widthAnchor.constraint(equalToConstant: 100),
//            countdownLabel.heightAnchor.constraint(equalToConstant: 40)
//        ])
//    }

}

