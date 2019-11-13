//
//  TimerSetupViewController.swift
//  Final_project
//
//  Created by evanlou on 11/10/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

class TimerSetupViewController: UIViewController {
    
    var setTitleLabel: UILabel!
    var setTitleField: UITextField!
    var setTimeLabel: UILabel!
    var setTimeField: UITextField!
    var backBtn: UIButton!
    
    var delegate: TimerSetupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setTitleLabel = UILabel()
        setTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        setTitleLabel.text = "To-Do name:"
        setTitleLabel.textColor = .black
        setTitleLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(setTitleLabel)
        
        setTitleField = UITextField()
        setTitleField.translatesAutoresizingMaskIntoConstraints = false
        setTitleField.textColor = .black
        setTitleField.backgroundColor = .gray
        setTitleField.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(setTitleField)
        
        
        setTimeLabel = UILabel()
        setTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        setTimeLabel.text = "To-Do duration:"
        setTimeLabel.textColor = .black
        setTimeLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(setTimeLabel)
        
        setTimeField = UITextField()
        setTimeField.translatesAutoresizingMaskIntoConstraints = false
        setTimeField.textColor = .black
        setTimeField.font = UIFont.systemFont(ofSize: 20)
        setTimeField.backgroundColor = .gray
        view.addSubview(setTimeField)
        
        backBtn = UIButton()
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setTitle("OK", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        backBtn.addTarget(self, action: #selector(setTimerAndBack), for: .touchUpInside)
        view.addSubview(backBtn)
        
        setUpConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            setTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            setTitleLabel.widthAnchor.constraint(equalToConstant: 200),
            setTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ]);
        NSLayoutConstraint.activate([
            setTitleField.centerXAnchor.constraint(equalTo: setTitleLabel.centerXAnchor),
            setTitleField.topAnchor.constraint(equalTo: setTitleLabel.bottomAnchor, constant: 20),
            setTitleField.heightAnchor.constraint(equalToConstant: 30),
            setTitleField.widthAnchor.constraint(equalToConstant: 200)
        ]);
        
        NSLayoutConstraint.activate([
            setTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setTimeLabel.topAnchor.constraint(equalTo: setTitleField.bottomAnchor, constant: 50),
            setTimeLabel.heightAnchor.constraint(equalToConstant: 30),
            setTimeLabel.widthAnchor.constraint(equalToConstant: 200)
        ]);
        NSLayoutConstraint.activate([
            setTimeField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setTimeField.topAnchor.constraint(equalTo: setTimeLabel.bottomAnchor, constant: 20),
            setTimeField.heightAnchor.constraint(equalToConstant: 30),
            setTimeField.widthAnchor.constraint(equalToConstant: 200)
        ]);
        NSLayoutConstraint.activate([
            backBtn.centerXAnchor.constraint(equalTo: setTimeField.centerXAnchor),
            backBtn.topAnchor.constraint(equalTo: setTimeField.bottomAnchor, constant: 50),
            backBtn.widthAnchor.constraint(equalToConstant: 50),
            backBtn.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func setTimerAndBack() {
        if let titleText = setTitleField.text, let timeText = setTimeField.text {
            delegate?.timerSetup(newTitle: titleText, newDuration: timeText)
        }
        dismiss(animated: true, completion: nil)
    }
    

}
