//
//  LoginViewController.swift
//  Launch
//
//  Created by yifeng Shi on 11/16/19.
//  Copyright © 2019 Yifeng. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
//    var loginBtn : UIButton!
    var textField : UITextField!
    var passwordField : UITextField!
    
    private let loginContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let loginTitle: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont(name: "Comfortaa-Bold", size: 50)
        title.textAlignment = .center
        title.text = "Welcome Back!"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let usernameTitle: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont(name: "Poppins-Regular", size: 14)
        title.textAlignment = .center
        title.text = "Email:"
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
    
    private let passWordTitle: UILabel = {
        let title = UILabel()
        title.textColor = .black
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
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginBtn: UIButton = {
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
        
        usernameTextField.addTarget(self, action: #selector(validateEmail), for: .editingDidEnd)
        loginContentView.addSubview(loginTitle)
        loginContentView.addSubview(usernameTitle)
        
        dismissKeyboard(textField: usernameTextField)
        loginContentView.addSubview(usernameTextField)
        loginContentView.addSubview(passWordTitle)
        dismissKeyboard(textField: passwordTextField)
        loginContentView.addSubview(passwordTextField)
        loginContentView.addSubview(loginBtn)
        
        view.addSubview(loginContentView)
        
        // arrange the layout
        
        
        constraintsInit()
        view.backgroundColor = UIColor.init(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
        tabBarController?.tabBar.isHidden = true
        
    }
//    @objc func isLogin() {
//
//       if (self.passwordField.text == nil) {
//           let alert = UIAlertController(title: nil, message: "Password isempty", preferredStyle: .alert)
//           let defaultAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
//           alert.addAction(defaultAction)
//           present(alert, animated: true, completion: nil)
//       } else {
//           getlogin()
//       }
//    }
//
    
    // use Regular expression to check and validate the email address
    func isValidEmail(emailStr: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredict = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let res = emailPredict.evaluate(with: emailStr)
        
        return res
    }
    
    
    @objc func validateEmail() {
        let res = isValidEmail(emailStr: self.usernameTextField.text ?? "")
        if res == true {
            self.usernameTextField.layer.borderWidth = 1
            self.usernameTextField.layer.borderColor = UIColor.systemGreen.cgColor
        } else {
            self.usernameTextField.layer.borderWidth = 1
            self.usernameTextField.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
    
    @objc func getLogin() {
        
        let isSuccess = NetworkManager.postLogin(email: usernameTextField.text ?? "none", password: passwordTextField.text  ?? "none") {
            success in DispatchQueue.main.async {
                if let succ = success {
                    if succ {
                        self.loginSuccess()
                    } else {
                        self.loginFail()
                    }
                } else {
                    self.loginNil()
                }
            }
        }
//            if let isSuccess = NetworkManager.postLogin(email: usernameTextField.text ?? "none", password: passwordTextField.text  ?? "none", completion: true) {
//            if isSuccess {
//                loginSuccess()
//            } else {
//                loginFail()
//            }
//        } else {
//            loginNil()
//        }
        
    }
    
    @objc func loginSuccess() {
        let alert = UIAlertController(title: "login successfully!", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func loginFail() {
        let alert = UIAlertController(title: "login failed!", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func loginNil() {
        let alert = UIAlertController(title: "please try again!", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    
    
    
    func constraintsInit() {
         loginContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
         
         loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
         
         loginContentView.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
         
         loginContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         
         loginTitle.topAnchor.constraint(equalTo: loginContentView.topAnchor, constant: 10).isActive = true
         
         loginTitle.centerXAnchor.constraint(equalTo: loginContentView.centerXAnchor).isActive = true
         
         usernameTitle.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 20).isActive = true
        
         usernameTitle.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 10).isActive = true
         
         usernameTextField.topAnchor.constraint(equalTo: usernameTitle.bottomAnchor, constant: 10).isActive = true
         
         usernameTextField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 10).isActive = true
         
         usernameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
         passWordTitle.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10).isActive = true
         
         passWordTitle.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 10).isActive = true
         
         passwordTextField.topAnchor.constraint(equalTo: passWordTitle.bottomAnchor, constant: 10).isActive = true

         passwordTextField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 10).isActive = true
         
         passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
         
         loginBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
         
         loginBtn.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive = true
         loginBtn.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive = true
    }
    
    func dismissKeyboard(textField: UITextField) {
        textField.addTarget(self, action: #selector(doNothing), for: .editingDidEndOnExit)
    }
    
    @objc func doNothing() {
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
