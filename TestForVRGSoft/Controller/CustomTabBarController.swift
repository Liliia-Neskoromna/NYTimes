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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sharedRequest.loadData()
    }
}
