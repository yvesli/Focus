//
//  LoginAndSignupViewController.swift
//  Launch
//
//  Created by yifeng Shi on 11/16/19.
//  Copyright © 2019 Yifeng. All rights reserved.
//

import UIKit


class LoginAndSignupViewController: UIViewController {
    
    var loginBtn: UIButton!
    var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        loginBtn = UIButton()
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.addTarget(self, action: #selector(changeToLoginView), for: .touchUpInside)
        loginBtn.setTitle("Login", for: .normal)
        view.addSubview(loginBtn)
        
        signUpBtn = UIButton()
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        signUpBtn.addTarget(self, action: #selector(changeToSignUpView), for: .touchUpInside)
        signUpBtn.setTitle("Sign up", for: .normal)
        view.addSubview(signUpBtn)
        // Do any additional setup after loading the view.
        view.layer.contents = #imageLiteral(resourceName: "bike-on-the-hill-with-body-of-water-scenery-2223047").cgImage
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginBtn.widthAnchor.constraint(equalToConstant: 100),
            loginBtn.heightAnchor.constraint(equalToConstant: 30)
        ]);
        
        NSLayoutConstraint.activate([
            signUpBtn.centerXAnchor.constraint(equalTo: loginBtn.centerXAnchor),
            signUpBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30),
            signUpBtn.widthAnchor.constraint(equalToConstant: 100),
            signUpBtn.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func changeToSignUpView() {
        let signUpView = SignUpViewController()
        navigationController?.pushViewController(signUpView, animated: true)
    }
    
    @objc func changeToLoginView() {
        let loginView = LoginViewController()
        navigationController?.pushViewController(loginView, animated: true)
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
