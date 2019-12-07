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
    var backAlert: UIAlertController!
    var completeAlert: UIAlertController!
    
    var image: String
    var duration: String
    var eventName: String
    
    var timer: Timer?
    var timeLeft = 0
    
    init(image: String, duration: String, title: String) {
        self.image = image
        self.duration = duration
        self.eventName = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
//        view.setBackground(for: image)
        
        backBtn = UIButton()
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setTitle("Back", for: .normal)
        backBtn.setTitleColor(.white, for: .normal)
//        backBtn.backgroundColor = .white
        backBtn.layer.cornerRadius = 20
        backBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 30)
        backBtn.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
        view.addSubview(backBtn)
        
        countdownLabel = UILabel()
        countdownLabel.translatesAutoresizingMaskIntoConstraints = false
        countdownLabel.text = "Start"
        countdownLabel.textAlignment = .center
        countdownLabel.textColor = .white
        countdownLabel.font = UIFont.systemFont(ofSize: 50)
        view.addSubview(countdownLabel)
        
        shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -CGFloat.pi/2, endAngle: -0.49*CGFloat.pi, clockwise: false)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 1
        view.layer.addSublayer(shapeLayer)
        
        backAlert = UIAlertController(title: "Quit \(eventName)?", message: "All your progress would be lost", preferredStyle: UIAlertController.Style.alert)
        backAlert.setValue(NSAttributedString(string: backAlert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]), forKey: "attributedTitle")
        backAlert.setValue(NSAttributedString(string: backAlert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]), forKey: "attributedMessage")
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) {(action: UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
//        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive, handler: )
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        backAlert.addAction(cancelAction)
        backAlert.addAction(confirmAction)
        
        completeAlert = UIAlertController(title: "Session Completed!", message: nil, preferredStyle: .alert)
        let completeOKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        completeAlert.addAction(completeOKAction)

        
        setUpConstraints()
    }
    
    func setUpConstraints () {
        NSLayoutConstraint.activate([
//            backBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            backBtn.heightAnchor.constraint(equalToConstant: 40),
            backBtn.widthAnchor.constraint(equalToConstant: 100)
        ]);
        
        NSLayoutConstraint.activate([
            countdownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countdownLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            countdownLabel.widthAnchor.constraint(equalToConstant: 200),
            countdownLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    // When this view appears, the timer automatically starts
    override func viewDidAppear(_ animated: Bool) {
        beginTimer()
    }
    
    
    @objc func backToMain() {
        present(backAlert, animated: true, completion: nil)
//        dismiss(animated: true, completion: nil)
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
            self.present(completeAlert, animated: true, completion: nil)
        }
        countdownLabel.text = min + ":" + sec
    }
}


//extension UIView {
//    func setBackground(for image: String) {
//        let width = UIScreen.main.bounds.size.width
//        let height = UIScreen.main.bounds.size.height
//
//        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
//        imageViewBackground.image = UIImage(named: image)
//
//        // you can change the content mode:
//        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
//
//        self.addSubview(imageViewBackground)
//        self.sendSubviewToBack(imageViewBackground)
//    }
//}
