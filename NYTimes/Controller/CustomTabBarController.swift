//
//  CustomTabBarController.swift
//  TestForVRGSoft
//
//  Created by Lilia on 8/14/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import UIKit
import Alamofire

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let mainViewController = ArticlesMainViewController()
        let mostEmailedNavController = UINavigationController(rootViewController: mainViewController)
        mostEmailedNavController.tabBarItem.title = "Most Emailed"
        
        //        let mostSharedNavController = UINavigationController(rootViewController: mainViewController)
        //        mostEmailedNavController.tabBarItem.title = "Most Shared"
        
        //        viewControllers = [mostEmailedNavController,
        //                           createDummyNavControllerWithTitles(title: "Most Shared"),
        //                           createDummyNavControllerWithTitles(title: "Most Emailed"),
        //                           createDummyNavControllerWithTitles(title: "Most Viewed"),
        //        ]
        
    }
    
    //    private func createDummyNavControllerWithTitles(title: String) -> UINavigationController {
    //        let viewController = UIViewController()
    //        let navController = UINavigationController(rootViewController: viewController)
    //        navController.tabBarItem.title = title
    //        return navController
    //
    //        (viewController as? ArticlesMainViewController).currentControllerType = .articles
    
}


