//
//  LoginViewController.swift
//  Launch
//
//  Created by yifeng Shi on 11/16/19.
//  Copyright © 2019 Yifeng. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var loginBtn : UIButton!
    var textField : UITextField!
    var passwordField : UITextField!
    
    private let loginContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let loginTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Comfortaa-Bold", size: 50)
        title.textAlignment = .center
        title.text = "Welcome Back!"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let UsernameTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "User Name:"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let usernameTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.placeholder = "User Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let PassWordTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.412, green: 0.38, blue: 0.38, alpha: 1)
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Password:"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let passwordTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let LoginBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(red: 0.412, green: 0.382, blue: 0.382, alpha: 1)
        btn.setTitle("Sign In", for : .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(getLogin), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginContentView.addSubview(loginTitle)
        loginContentView.addSubview(UsernameTitle)
        loginContentView.addSubview(usernameTextField)
        loginContentView.addSubview(PassWordTitle)
        loginContentView.addSubview(passwordTextField)
        loginContentView.addSubview(LoginBtn)
        
        view.addSubview(loginContentView)
        
        // arrange the layout
        
        constraintsInit()
        
        view.layer.contents = #imageLiteral(resourceName: "brown-leaves").cgImage
        
        
    }
    
    @objc func getLogin() {
        NetworkManager.postLogin(email: usernameTextField.text ?? "none", password: passwordTextField.text  ?? "none")
    }
    
    
    
    func constraintsInit() {
         loginContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
         
         loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
         
         loginContentView.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
         
         loginContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         
         loginTitle.topAnchor.constraint(equalTo: loginContentView.topAnchor, constant: 10).isActive = true
         
         loginTitle.centerXAnchor.constraint(equalTo: loginContentView.centerXAnchor).isActive = true
         
         UsernameTitle.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 20).isActive = true
        
         UsernameTitle.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 10).isActive = true
         
         usernameTextField.topAnchor.constraint(equalTo: UsernameTitle.bottomAnchor, constant: 10).isActive = true
         
         usernameTextField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 10).isActive = true
         
         PassWordTitle.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10).isActive = true
         
         PassWordTitle.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 10).isActive = true
         
         passwordTextField.topAnchor.constraint(equalTo: PassWordTitle.bottomAnchor, constant: 10).isActive = true

         passwordTextField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 10).isActive = true
         
         
         LoginBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
         
         LoginBtn.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive = true
         LoginBtn.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive = true
    }
    
//    @objc func handleLoginTouchUpInside() {
//        print("Login has been placed")
//        if textField.isFirstResponder {
//            textField.resignFirstResponder()
//        }
//
//        if passwordField.isFirstResponder {
//            passwordField.resignFirstResponder()
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
