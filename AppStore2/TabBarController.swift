//
//  TabBarController.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 03.12.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
        createController(viewController: MainController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Apps", imageName: "apps"),
        createController(viewController: MusicController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Main", imageName: "today_icon"),
        createController(viewController: SearchController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Search", imageName: "search"),
        ]
    }

    func createController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
}

