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
        
        let firstViewController = FirstViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "待办", image: UIImage(named: "text-list-7.png"), tag: 1)
//        firstViewController.tabBarItem.title = "1"

        let secondViewController = SecondViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "home-7.png"), tag: 2)
//        secondViewController.tabBarItem.title = "2"

        let tabBarList = [firstViewController, secondViewController]
        viewControllers = tabBarList

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
