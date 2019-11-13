//
//  TimerViewController.swift
//  Final_project
//
//  Created by evanlou on 11/8/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
//    var delegate: TimerDelegate?
    var backBtn: UIButton!
    
    var image: String
    
    init(image: String) {
        self.image = image
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
        backBtn.setTitle("返回", for: .normal)
        backBtn.setTitleColor(.white, for: .normal)
        backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        backBtn.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
        view.addSubview(backBtn)
        
        setUpConstraints()
    }
    
    func setUpConstraints () {
        NSLayoutConstraint.activate([
            backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backBtn.heightAnchor.constraint(equalToConstant: 30),
            backBtn.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func backToMain() {
        dismiss(animated: true, completion: nil)
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
