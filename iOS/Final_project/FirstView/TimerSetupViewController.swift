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
    func timerSetup(newTitle: String?, newDuration: String?)
}


class TimerSetupViewController: UIViewController {
    
    var setTitleLabel: UILabel!
    var setTitleField: UITextField!
    var setTimeLabel: UILabel!
    var timePicker: UIDatePicker!
    var newTimePicker: UIPickerView!
    var cancelImgView: UIImageView!
    var setImageView: UIImageView!
    var setLabel: UILabel!
    var cancelLabel: UILabel!
    var setTitleView = UITextView()
    
    var titleText: String?
    var timeText = ""
    
    var delegate: TimerSetupDelegate?
    var delegateDelete: TimerDeleteDelegate?
    
    var curCell: UICollectionViewCell? = nil
    
    init(currentCell: UICollectionViewCell? = nil, title: String? = nil) {
        if let cell = currentCell {
            curCell = cell
            titleText = title ?? ""
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
        setTitleLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 40)
        view.addSubview(setTitleLabel)
        
        setTitleField = UITextField()
        setTitleField.translatesAutoresizingMaskIntoConstraints = false
        setTitleField.textColor = .black
        setTitleField.backgroundColor = .white
        setTitleField.layer.cornerRadius = 10
        setTitleField.layer.borderWidth = 0.25
        setTitleField.layer.borderColor = UIColor.white.cgColor
        setTitleField.layer.shadowColor = UIColor.gray.cgColor
        setTitleField.layer.shadowOffset = CGSize(width: 5, height: 5)
        setTitleField.layer.shadowRadius = 5
        setTitleField.layer.shadowOpacity = 1.0
        setTitleField.font = UIFont.systemFont(ofSize: 20)
        if let _ = titleText {
            setTitleField.text = titleText
        } else {
            setTitleField.placeholder = "Study"
        }

//        setTitleField.font = UIFont.systemFont(ofSize: 20)
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        setTitleField.leftView = paddingView
        setTitleField.rightView = paddingView
        setTitleField.leftViewMode = UITextField.ViewMode.always
        setTitleField.rightViewMode = UITextField.ViewMode.always
        view.addSubview(setTitleField)
        
        timePicker = UIDatePicker()
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.datePickerMode = .countDownTimer
//        timePicker.countDownDuration = 1000
//        let timeFormatter = DateFormatter()
//        timeFormatter.dateFormat = "HH:mm"
//        timePicker.minimumDate = timeFormatter.date(from: "0:00")
//        timePicker.maximumDate = timeFormatter.date(from: "9:00")
        view.addSubview(timePicker)
        
        cancelImgView = UIImageView(image: UIImage(named: "cancel-icon"))
        cancelImgView.translatesAutoresizingMaskIntoConstraints = false
        cancelImgView.isHidden = false
        cancelImgView.contentMode = .scaleAspectFit
        cancelImgView.image = cancelImgView.image?.withRenderingMode(.alwaysTemplate)
        cancelImgView.tintColor = UIColor.gray
        cancelImgView.isUserInteractionEnabled = true
        cancelImgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelTimerAndBack)))
        view.addSubview(cancelImgView)
        
        setImageView = UIImageView(image: UIImage(named: "check-circle"))
        setImageView.translatesAutoresizingMaskIntoConstraints = false
        setImageView.isHidden = false
        setImageView.contentMode = .scaleAspectFit
        setImageView.image = setImageView.image?.withRenderingMode(.alwaysTemplate)
        setImageView.tintColor = UIColor.systemPink
        setImageView.isUserInteractionEnabled = true
        setImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setTimerAndBack)))
        view.addSubview(setImageView)
        
        setLabel = UILabel()
        setLabel.text = "Save"
        setLabel.translatesAutoresizingMaskIntoConstraints = false
        setLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        setLabel.textColor = UIColor.systemPink
        setLabel.isUserInteractionEnabled = true
        setLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setTimerAndBack)))
        view.addSubview(setLabel)
        
        cancelLabel = UILabel()
        cancelLabel.text = "Cancel"
        cancelLabel.translatesAutoresizingMaskIntoConstraints = false
        cancelLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        cancelLabel.textColor = UIColor.systemGray
        cancelLabel.isUserInteractionEnabled = true
        cancelLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelTimerAndBack)))
        view.addSubview(cancelLabel)

        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            setTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            setTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setTitleLabel.widthAnchor.constraint(equalToConstant: 200),
            setTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ]);
        NSLayoutConstraint.activate([
            setTitleField.leadingAnchor.constraint(equalTo: setTitleLabel.leadingAnchor),
            setTitleField.topAnchor.constraint(equalTo: setTitleLabel.bottomAnchor, constant: 20),
            setTitleField.heightAnchor.constraint(equalToConstant: 50),
            setTitleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]);
        
        NSLayoutConstraint.activate([
            timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timePicker.topAnchor.constraint(equalTo: setTitleField.bottomAnchor, constant: 80),
            timePicker.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            timePicker.heightAnchor.constraint(equalToConstant: 300)
        ]);
        
        NSLayoutConstraint.activate([
            cancelImgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            cancelImgView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            cancelImgView.heightAnchor.constraint(equalToConstant: 50),
            cancelImgView.widthAnchor.constraint(equalToConstant: 50)
        ]);
        
        NSLayoutConstraint.activate([
            setImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            setImageView.bottomAnchor.constraint(equalTo: cancelImgView.bottomAnchor),
            setImageView.heightAnchor.constraint(equalToConstant: 50),
            setImageView.widthAnchor.constraint(equalToConstant: 50)
        ]);
        
        NSLayoutConstraint.activate([
            setLabel.centerXAnchor.constraint(equalTo: setImageView.centerXAnchor),
            setLabel.topAnchor.constraint(equalTo: setImageView.bottomAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            cancelLabel.centerXAnchor.constraint(equalTo: cancelImgView.centerXAnchor),
            cancelLabel.topAnchor.constraint(equalTo: cancelImgView.bottomAnchor, constant: 10)
        ])
    }
    
    @objc func setTimerAndBack() {
//        if let titleText = setTitleField.text {
//            let duration = timePicker.countDownDuration
        timeText = String(Int(timePicker.countDownDuration/60))
//            delegate?.timerSetup(newTitle: titleText, newDuration: timeText)
//        }
        delegate?.timerSetup(newTitle: setTitleField.text!, newDuration: timeText)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelTimerAndBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func deleteTimerAndBack() {
        delegateDelete?.timerDelete(selectedCell: curCell!)
        dismiss(animated: true, completion: nil)
    }
    
}

