//
//  RequestController.swift
//  TestForVRGSoft
//
//  Created by Lilia on 8/14/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import UIKit
import Alamofire

class ArticlesRequest {
    
    static let sharedRequest = ArticlesRequest()
    
    func loadData() {
        
        AF.request("https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=kcZPVVrUr4PUmXGnWGT8trQK1pe7A7mX", method: .get).responseJSON { (response) in
            print("fv")
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        }
    }
}
