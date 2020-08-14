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
    let params: [String: String] = ["api-key": "kcZPVVrUr4PUmXGnWGT8trQK1pe7A7mX"]
    
    let requestURL = "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json"
    
    func loadData() {
        
        AF.request(requestURL, method: .get, parameters: params).responseJSON { (response) in
            
            switch response.result {
            case .success:
                //print(response.result)
                guard  let data = try? response.result.get()  else {
                    fatalError("Cannot get res")
                }
                ManagerArticlesJSON.sharedManagerArticlesJSON.parseJSON(with: data)
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
    
    
}
