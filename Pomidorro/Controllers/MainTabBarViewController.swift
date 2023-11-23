//
//  MainTabBarViewController.swift
//  Pomidorro
//
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    
    //MARK: -LifeCycl-
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let firstViewController = ViewController()
            firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

            let secondViewController = SecoundViewController()
           secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

            let thirdViewController = AddNewTaskViewController()
            thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

            let tabBarList = [firstViewController, secondViewController, thirdViewController]
            viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
        }
}
