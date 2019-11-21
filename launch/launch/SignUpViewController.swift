//
//  SignUpViewController.swift
//  Launch
//
//  Created by yifeng Shi on 11/20/19.
//  Copyright © 2019 Yifeng. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    private let SignUpContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let SignUpBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(red: 0.412, green: 0.382, blue: 0.382, alpha: 1)
        btn.setTitle("Submit!", for : .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let WelcomeTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Glad You're here!"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let NameTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Name:"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let NameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.frame = .zero
        textField.placeholder = "Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let EmailTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Email:"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let EmailField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Email"
        textField.frame = .zero
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let PassWordTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Enter a new password:"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let PasswordField: UITextField = {
           let textField = UITextField()
           textField.backgroundColor = .white
           textField.placeholder = "Password"
           textField.frame = .zero
           textField.borderStyle = .roundedRect
           textField.translatesAutoresizingMaskIntoConstraints = false
           return textField
    }()
    
    
    private let RePasswordTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Re-Enter the password:"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let RePasswordField: UITextField = {
           let textField = UITextField()
           textField.backgroundColor = .white
           textField.frame = .zero
           textField.placeholder = "New Password"
           textField.borderStyle = .roundedRect
           textField.translatesAutoresizingMaskIntoConstraints = false
           return textField
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        SignUpContentView.addSubview(WelcomeTitle)
        
        SignUpContentView.addSubview(NameTitle)
       
        SignUpContentView.addSubview(NameField)
        
        SignUpContentView.addSubview(EmailTitle)
        
        SignUpContentView.addSubview(EmailField)
        
        SignUpContentView.addSubview(PassWordTitle)
        
        SignUpContentView.addSubview(PasswordField)
        
        SignUpContentView.addSubview(RePasswordTitle)
        
        SignUpContentView.addSubview(RePasswordField)
        
        SignUpContentView.addSubview(SignUpBtn)
        
        view.addSubview(SignUpContentView)
        
        constraintsInit()
        view.layer.contents = #imageLiteral(resourceName: "Forest-SignUp").cgImage
        // Do any additional setup after loading the view.
    }
    
    func constraintsInit() {
        SignUpContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true

        SignUpContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true

        SignUpContentView.heightAnchor.constraint(equalToConstant:  view.frame.height / 2).isActive = true

        SignUpContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        WelcomeTitle.topAnchor.constraint(equalTo: SignUpContentView.topAnchor, constant: 10).isActive = true

        WelcomeTitle.centerXAnchor.constraint(equalTo: SignUpContentView.centerXAnchor).isActive = true
        
        NameTitle.topAnchor.constraint(equalTo: WelcomeTitle.bottomAnchor, constant: 10).isActive = true
        
        NameTitle.leftAnchor.constraint(equalTo: SignUpContentView.leftAnchor, constant: 10).isActive = true
        
        NameField.topAnchor.constraint(equalTo: NameTitle.bottomAnchor, constant: 10).isActive = true
        
        NameField.leftAnchor.constraint(equalTo: SignUpContentView.leftAnchor, constant: 10).isActive = true
        
        EmailTitle.topAnchor.constraint(equalTo: NameField.bottomAnchor, constant: 10).isActive = true
        
        EmailTitle.leftAnchor.constraint(equalTo: SignUpContentView.leftAnchor, constant: 10).isActive = true
        
        EmailField.topAnchor.constraint(equalTo: EmailTitle.bottomAnchor, constant: 10).isActive = true
        
        EmailField.leftAnchor.constraint(equalTo: SignUpContentView.leftAnchor, constant: 10).isActive = true
        
        PassWordTitle.topAnchor.constraint(equalTo: EmailField.bottomAnchor, constant: 10).isActive = true
        
        PassWordTitle.leftAnchor.constraint(equalTo: SignUpContentView.leftAnchor, constant: 10).isActive = true
        
        PasswordField.topAnchor.constraint(equalTo: PassWordTitle.bottomAnchor, constant: 10).isActive = true
        
        PasswordField.leftAnchor.constraint(equalTo: SignUpContentView.leftAnchor, constant: 10).isActive = true
        
        RePasswordTitle.topAnchor.constraint(equalTo: PasswordField.bottomAnchor, constant: 10).isActive = true
        
        RePasswordTitle.leftAnchor.constraint(equalTo: SignUpContentView.leftAnchor, constant: 10).isActive = true
        
        RePasswordField.topAnchor.constraint(equalTo: RePasswordTitle.bottomAnchor, constant: 10).isActive = true
        
        RePasswordField.leftAnchor.constraint(equalTo: SignUpContentView.leftAnchor, constant: 10).isActive = true
        
        SignUpBtn.topAnchor.constraint(equalTo: RePasswordField.bottomAnchor, constant: 40).isActive = true
        
        SignUpBtn.leftAnchor.constraint(equalTo: SignUpContentView.leftAnchor, constant: 20).isActive = true
        
        SignUpBtn.rightAnchor.constraint(equalTo: SignUpContentView.rightAnchor, constant: -20).isActive = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
