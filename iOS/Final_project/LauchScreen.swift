//
//  LauchScreen.swift
//  Final_project
//
//  Created by evanlou on 11/24/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit



class LauchScreen: UIViewController {

    let logoImage = UIImageView(image: UIImage(named: "new-welcome-logo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImage.contentMode = .scaleAspectFit
        view.addSubview(logoImage)
        
        logoImage.frame = CGRect(x: view.frame.midX - 50, y: view.frame.midY - 50, width: 100, height: 100)
        
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.scaleDownAnimation()
        }
    }
    
    func scaleDownAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.logoImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) {
            ( success ) in
            self.scaleUpAnimation()
        }
    }
    
    func scaleUpAnimation() {
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseIn, animations: {
            self.logoImage.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) { ( success ) in
            // push LoginAndSignUp view controller
            // set the second view controller to be UINavigationController and let the launch screen present it
            let mainController = TabBarController()
            mainController.modalPresentationStyle = .fullScreen
            self.present(mainController, animated: false, completion: nil)
            self.removeSplashScreen()
        }
    }
    
    func removeSplashScreen() {
//        view.removeFromSuperview()
    }

}

