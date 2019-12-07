//
//  TabBarController.swift
//  Final_project
//
//  Created by evanlou on 11/6/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    func setUpTabBar() {
        
        let firstViewController = UINavigationController(rootViewController: FirstViewController())
        firstViewController.tabBarItem.image = UIImage(named: "clock")
        firstViewController.tabBarItem.title = "Timer"
        firstViewController.navigationBar.barTintColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)

        let secondViewController = UINavigationController(rootViewController: SecondViewController())
        secondViewController.tabBarItem.image = UIImage(named: "home-7.png")
        secondViewController.tabBarItem.title = "Setting"
        secondViewController.navigationBar.barTintColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
        
        let thirdViewController = UINavigationController(rootViewController: ThirdViewController())
        thirdViewController.tabBarItem.image = UIImage(named: "text-list-7.png")
        thirdViewController.tabBarItem.title = "To-Dos"
        thirdViewController.navigationBar.barTintColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
        
        viewControllers = [firstViewController, thirdViewController, secondViewController]
    }
    

}
