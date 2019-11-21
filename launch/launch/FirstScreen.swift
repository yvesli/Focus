//
//  FirstScreen.swift
//  Launch
//
//  Created by yifeng Shi on 11/15/19.
//  Copyright © 2019 Yifeng. All rights reserved.
//

import UIKit



class FirstScreen: UIViewController {

    let logoImage = UIImageView(image: UIImage(named: "new-welcome-logo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImage.contentMode = .scaleAspectFit
        view.addSubview(logoImage)
        
        logoImage.frame = CGRect(x: view.frame.midX - 50, y: view.frame.midY - 50, width: 100, height: 100)
        
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
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
            let mainController = UINavigationController(rootViewController: LoginAndSignupViewController())

            mainController.modalPresentationStyle = .fullScreen
            
           self.present(mainController, animated: true, completion: nil)
            
            self.removeSplashScreen()
        }
    }
    
    func removeSplashScreen() {
        
        view.removeFromSuperview()
        
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
