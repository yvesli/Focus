//
//  TimerSetupViewController.swift
//  Final_project
//
//  Created by evanlou on 11/10/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

protocol TimerDeleteDelegate {
    func timerDelete(selectedCell: UICollectionViewCell)
}

protocol TimerSetupDelegate {
    func timerSetup(newTitle: String, newDuration: String)
}


class TimerSetupViewController: UIViewController {
    
    var setTitleLabel: UILabel!
    var setTitleField: UITextField!
    var setTimeLabel: UILabel!
    var setTimeField: UITextField!
    var timePicker: UIDatePicker!
    var backBtn: UIButton!
    var newTimePicker: UIPickerView!
//    var deleteBtn: UIButton!
    
    var titleText = ""
    var timeText = ""
    
    var delegate: TimerSetupDelegate?
    var delegateDelete: TimerDeleteDelegate?
    
    var curCell: UICollectionViewCell? = nil
    
    init(currentCell: UICollectionViewCell? = nil) {
        if let cell = currentCell {
            curCell = cell
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        
        setTitleLabel = UILabel()
        setTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        setTitleLabel.text = "Set name"
        setTitleLabel.textColor = .black
        setTitleLabel.font = UIFont.boldSystemFont(ofSize: 35)
        view.addSubview(setTitleLabel)
        
        setTitleField = UITextField()
        setTitleField.translatesAutoresizingMaskIntoConstraints = false
        setTitleField.textColor = .black
        setTitleField.backgroundColor = .white
        setTitleField.layer.cornerRadius = 20
        setTitleField.layer.borderWidth = 0.25
        setTitleField.layer.borderColor = UIColor.white.cgColor
        setTitleField.layer.shadowColor = UIColor.gray.cgColor
        setTitleField.layer.shadowOffset = CGSize(width: 5, height: 5)
        setTitleField.layer.shadowRadius = 5
        setTitleField.layer.shadowOpacity = 1.0
        setTitleField.font = UIFont(name: "Roboto-Black", size: 20)
//        setTitleField.font = UIFont.systemFont(ofSize: 20)
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        setTitleField.leftView = paddingView
        setTitleField.rightView = paddingView
        setTitleField.leftViewMode = UITextField.ViewMode.always
        setTitleField.rightViewMode = UITextField.ViewMode.always
        view.addSubview(setTitleField)
        
        
//        setTimeLabel = UILabel()
//        setTimeLabel.translatesAutoresizingMaskIntoConstraints = false
//        setTimeLabel.text = "To-Do duration:"
//        setTimeLabel.textColor = .black
//        setTimeLabel.font = UIFont.systemFont(ofSize: 20)
//        view.addSubview(setTimeLabel)
        
        timePicker = UIDatePicker()
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.datePickerMode = .countDownTimer
        timePicker.addTarget(self, action: #selector(changeDuration), for: .valueChanged)
        view.addSubview(timePicker)
        
        setTimeField = UITextField()
        setTimeField.translatesAutoresizingMaskIntoConstraints = false
        setTimeField.textColor = .black
        setTimeField.font = UIFont.systemFont(ofSize: 20)
        setTimeField.backgroundColor = .gray
        view.addSubview(setTimeField)
        
    
        backBtn = UIButton()
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setTitle("Set", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        backBtn.sizeToFit()
        backBtn.addTarget(self, action: #selector(setTimerAndBack), for: .touchUpInside)
        view.addSubview(backBtn)
        
        
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            setTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            setTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setTitleLabel.widthAnchor.constraint(equalToConstant: 200),
            setTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ]);
        NSLayoutConstraint.activate([
            setTitleField.leadingAnchor.constraint(equalTo: setTitleLabel.leadingAnchor),
            setTitleField.topAnchor.constraint(equalTo: setTitleLabel.bottomAnchor, constant: 20),
            setTitleField.heightAnchor.constraint(equalToConstant: 40),
//            setTitleField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30)
            setTitleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]);
        
//        NSLayoutConstraint.activate([
//            setTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            setTimeLabel.topAnchor.constraint(equalTo: setTitleField.bottomAnchor, constant: 50),
//            setTimeLabel.heightAnchor.constraint(equalToConstant: 30),
//            setTimeLabel.widthAnchor.constraint(equalToConstant: 200)
//        ]);
        
        NSLayoutConstraint.activate([
            timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            timePicker.topAnchor.constraint(equalTo: setTimeLabel.bottomAnchor, constant: 30),
            timePicker.topAnchor.constraint(equalTo: setTitleField.bottomAnchor, constant: 30),
            timePicker.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            timePicker.heightAnchor.constraint(equalToConstant: 300)
        ]);

        NSLayoutConstraint.activate([
            backBtn.centerXAnchor.constraint(equalTo: timePicker.centerXAnchor),
            backBtn.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 50),
            backBtn.widthAnchor.constraint(lessThanOrEqualToConstant: self.view.frame.width),
            backBtn.heightAnchor.constraint(equalToConstant: 30)
        ]);
    }
    
    @objc func setTimerAndBack() {
        if let titleText = setTitleField.text {
            delegate?.timerSetup(newTitle: titleText, newDuration: timeText)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func deleteTimerAndBack() {
        delegateDelete?.timerDelete(selectedCell: curCell!)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func changeDuration() {
        let duration = timePicker.countDownDuration
        timeText = String(Int(duration/60))
    }
}
