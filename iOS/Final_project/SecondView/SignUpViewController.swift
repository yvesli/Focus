//
//  SignUpViewController.swift
//  Launch
//
//  Created by yifeng Shi on 11/20/19.
//  Copyright © 2019 Yifeng. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {
    private let signUpContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let signUpBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(red: 0.412, green: 0.382, blue: 0.382, alpha: 1)
        btn.setTitle("Submit!", for : .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(isSubmit), for: .touchUpInside)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let welcomeTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Glad You're here!"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let nameTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Name:"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let nameField: UITextField = {
        
        let textField = UITextField()
        
        textField.backgroundColor = .white
        textField.frame = .zero
        textField.placeholder = "Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Email:"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let emailField: UITextField = {
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
    
    private let passwordField: UITextField = {
           let textField = UITextField()
           textField.backgroundColor = .white
           textField.placeholder = "Password"
           textField.frame = .zero
           textField.borderStyle = .roundedRect
           textField.translatesAutoresizingMaskIntoConstraints = false
           
        
           return textField
    }()
    
    
    private let rePasswordTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Re-Enter the password:"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
    private let rePasswordField: UITextField = {
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
       
        
        rePasswordField.addTarget(self, action: #selector(isPasswordMatched), for: .editingDidEnd)
        
        signUpContentView.addSubview(welcomeTitle)
        
        signUpContentView.addSubview(nameTitle)
        
        dismissKeyboard(textField: nameField)
        signUpContentView.addSubview(nameField)
        
        signUpContentView.addSubview(emailTitle)
        
        dismissKeyboard(textField: emailField)
        signUpContentView.addSubview(emailField)
        
        signUpContentView.addSubview(PassWordTitle)
        
        dismissKeyboard(textField: passwordField)
        signUpContentView.addSubview(passwordField)
        
        signUpContentView.addSubview(rePasswordTitle)
        
        dismissKeyboard(textField: rePasswordField)
        signUpContentView.addSubview(rePasswordField)
        
        signUpContentView.addSubview(signUpBtn)
        
        signUpBtn.addTarget(self, action: #selector(isPasswordMatched), for: .touchDown)
        
        view.addSubview(signUpContentView)
        
        constraintsInit()
        view.layer.contents = #imageLiteral(resourceName: "2").cgImage
        // Do any additional setup after loading the view.
        
       
    }
    
    @objc func isSubmit() {
        if (self.passwordField.text != self.rePasswordField.text) {
            let alert = UIAlertController(title: nil, message: "Password unmatch", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        } else {
            getSignUp()
        }
     }
    
    
    // validate an email for the right format
    @objc func isPasswordMatched() {
        if (self.passwordField.text != self.rePasswordField.text) {
            
            self.rePasswordField.layer.borderWidth = 1
            self.rePasswordField.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            
            self.rePasswordField.layer.borderWidth = 1
            self.rePasswordField.layer.borderColor = UIColor.systemGreen.cgColor
        }
        view.reloadInputViews()
    }
    
    @objc func getSignUp() {
        NetworkManager.postSignUp(username: nameField.text ?? "none" , password: passwordField.text ?? "none", email: emailField.text ?? "none")
    }
    func constraintsInit() {
        signUpContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true

        signUpContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true

        signUpContentView.heightAnchor.constraint(equalToConstant:  view.frame.height / 2).isActive = true

        signUpContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        welcomeTitle.topAnchor.constraint(equalTo: signUpContentView.topAnchor, constant: 10).isActive = true

        welcomeTitle.centerXAnchor.constraint(equalTo: signUpContentView.centerXAnchor).isActive = true
        
        nameTitle.topAnchor.constraint(equalTo: welcomeTitle.bottomAnchor, constant: 10).isActive = true
        
        nameTitle.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 10).isActive = true
        
        nameField.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 10).isActive = true
        
        nameField.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 10).isActive = true
        
        nameField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
//        NameField.rightAnchor.constraint(equalTo: NameTitle.rightAnchor, constant: 10).isActive = true
        
        emailTitle.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10).isActive = true
        
        emailTitle.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 10).isActive = true
        
        emailField.topAnchor.constraint(equalTo: emailTitle.bottomAnchor, constant: 10).isActive = true
        
        emailField.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 10).isActive = true
        
//        EmailField.rightAnchor.constraint(equalTo: EmailTitle.rightAnchor, constant: 10).isActive = true
        
        emailField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        PassWordTitle.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10).isActive = true
        
        PassWordTitle.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 10).isActive = true
        
        passwordField.topAnchor.constraint(equalTo: PassWordTitle.bottomAnchor, constant: 10).isActive = true
        
        passwordField.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 10).isActive = true
        
//        PasswordField.rightAnchor.constraint(equalTo: PassWordTitle.rightAnchor, constant: 10).isActive = true
        passwordField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        rePasswordTitle.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10).isActive = true
        
        rePasswordTitle.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 10).isActive = true
        
        rePasswordField.topAnchor.constraint(equalTo: rePasswordTitle.bottomAnchor, constant: 10).isActive = true
        
        rePasswordField.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 10).isActive = true
        
//        RePasswordField.rightAnchor.constraint(equalTo: RePasswordTitle.rightAnchor, constant: 10).isActive = true
        rePasswordField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        signUpBtn.topAnchor.constraint(equalTo: rePasswordField.bottomAnchor, constant: 40).isActive = true
        
        signUpBtn.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 20).isActive = true
        
        signUpBtn.rightAnchor.constraint(equalTo: signUpContentView.rightAnchor, constant: -20).isActive = true
        
    }
    
    func dismissKeyboard(textField: UITextField) {
        textField.addTarget(self, action: #selector(doNothing), for: .editingDidEndOnExit)
    }
    
    @objc func doNothing() {
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
