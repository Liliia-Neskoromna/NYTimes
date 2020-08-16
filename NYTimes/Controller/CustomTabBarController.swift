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
    
    let sharedRequest = ArticlesRequest()
//    let sharedRequest = TestRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        sharedRequest.loadData()
//        let layout = UICollectionViewFlowLayout()
//        let emailedArticles = ArticlesMainViewController()
//        let mostEmailedNavController = UINavigationController(rootViewController: emailedArticles)
//        mostEmailedNavController.tabBarItem.title = "Most Emailed"
        
        (viewController as? ArticlesMainViewController).currentControllerType = .articles

    }
    
}
