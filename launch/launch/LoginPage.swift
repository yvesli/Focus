//
//  LoginPage.swift
//  Launch
//
//  Created by yifeng Shi on 11/16/19.
//  Copyright © 2019 Yifeng. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // alley-autumn-autumn-colours-autumn-leaves-235721 1

        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 617, height: 995)
        view.backgroundColor = .white

        view.alpha = 0.8
        let image0 = UIImage(named: "alley-autumn-autumn-colours-autumn-leaves-235721.jpg")?.cgImage
        let layer0 = CALayer()
        layer0.contents = image0
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 2.42, b: 0, c: 0, d: 1, tx: -0.71, ty: 0))
        layer0.bounds = view.bounds
        layer0.position = view.center
        view.layer.addSublayer(layer0)


        var parent = self.view!
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 617).isActive = true
        view.heightAnchor.constraint(equalToConstant: 995).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: -74).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: -64).isActive = true

// Do any additional setup after loading the view.
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
