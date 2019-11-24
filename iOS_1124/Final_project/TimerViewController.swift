//
//  TimerViewController.swift
//  Final_project
//
//  Created by evanlou on 11/8/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var backBtn: UIButton!
    var countdownLabel: UILabel!
    var shapeLayer: CAShapeLayer!
    
    var image: String
    var duration: String
    
    var timer: Timer?
    var timeLeft = 0
    
    init(image: String, duration: String) {
        self.image = image
        self.duration = duration
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground(for: image)
        
        backBtn = UIButton()
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setTitle("Back", for: .normal)
        backBtn.setTitleColor(.white, for: .normal)
        backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        backBtn.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
        view.addSubview(backBtn)
        
        countdownLabel = UILabel()
        countdownLabel.translatesAutoresizingMaskIntoConstraints = false
        countdownLabel.text = "Start"
        countdownLabel.textAlignment = .center
        countdownLabel.textColor = .white
        countdownLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(countdownLabel)
        
        shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: -0.49*CGFloat.pi, clockwise: false)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 1
        view.layer.addSublayer(shapeLayer)
        
        setUpConstraints()
    }
    
    func setUpConstraints () {
        NSLayoutConstraint.activate([
            backBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            backBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            backBtn.heightAnchor.constraint(equalToConstant: 30),
            backBtn.widthAnchor.constraint(equalToConstant: 60)
        ]);
        
        NSLayoutConstraint.activate([
            countdownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countdownLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            countdownLabel.widthAnchor.constraint(equalToConstant: 100),
            countdownLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // When this view appears, the timer automatically starts
    override func viewDidAppear(_ animated: Bool) {
        beginTimer()
    }
    
    
    @objc func backToMain() {
        dismiss(animated: true, completion: nil)
    }
    
    func beginTimer() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0

        if let dur = Double(duration) {
            basicAnimation.duration = CFTimeInterval(dur*60)
            timeLeft = Int(dur*60)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
        }
        
        shapeLayer.add(basicAnimation, forKey: "")
    }
    
    
    @objc func updateCountdown() {
        timeLeft -= 1
        
        var min: String
        if (timeLeft/60 == 0) {
            min = "00"
        } else if (timeLeft/60 < 10) {
            min = "0\(timeLeft/60)"
        } else {
            min = "\(timeLeft/60)"
        }
        
        var sec: String
        if (timeLeft%60 < 10) {
            sec = "0\(timeLeft%60)"
        } else {
            sec = "\(timeLeft%60)"
        }
        
        if (timeLeft <= 0) {
            min = "00"
            sec = "00"
            timer?.invalidate()
            timer = nil
        }
        countdownLabel.text = min + ":" + sec
    }
}


extension UIView {
    func setBackground(for image: String) {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: image)

        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}
