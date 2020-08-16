//
//  RequestController.swift
//  TestForVRGSoft
//
//  Created by Lilia on 8/14/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArticlesRequest {
    
    static let sharedRequest = ArticlesRequest()
        
    let params: [String: String] = ["api-key": "kcZPVVrUr4PUmXGnWGT8trQK1pe7A7mX"]
    let requestURL = "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json"
    
    var allArticlesId = [Int]()
    var allArticlesTitle = [String]()
    var allArticlesImages = [String]()
    
    func loadData() {
        
        AF.request(requestURL, method: .get, parameters: params).responseJSON { (response) in
            
            guard (try? response.result.get()) != nil else {
                fatalError("Cannot get data")
            }
            guard let json = try? JSON(response.result.get()) else {
                fatalError("Cannot get json")
            }
            let results = json["results"].arrayValue
            
            for result in results {
                let id = result["id"].intValue
                let title = result["title"].stringValue
                let image = result["media"][0]["media-metadata"][0]["url"].stringValue
                
                self.allArticlesId.append(id)
                self.allArticlesTitle.append(title)
                self.allArticlesImages.append(image)
            }
            
            
        }
        
        
        
        
        
        //            switch response.result {
        //            case .success:
        //                guard  let data = response.data else {
        //                    fatalError("Cannot get res")
        //                }
        //
        //                self.emailedArticles = ManagerArticlesJSON.sharedManagerArticlesJSON.parseJSON(with: data)
        //                //print("emailedArticles \(self.emailedArticles)")
        //
        //
        //            case let .failure(error):
        //                print(error)
        //            }
        //        }
        //    }
        //
        //
        //    func mapTo() -> [InnerArticle] {
        //
        //        for element in emailedArticles {
        //            let id = element.id
        //            let title = element.title
        //            let image = element.image
        //
        //            let item: InnerArticle = InnerArticle(innerId: id, innerTitle: title, innerImage: image)
        //            array.append(item)
        //
        //        }
        //        return array
        //    }
    }
}
