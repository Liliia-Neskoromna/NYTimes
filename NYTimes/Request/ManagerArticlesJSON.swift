//
//  ManagerJSON.swift
//  TestForVRGSoft
//
//  Created by Lilia on 8/14/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import Foundation
import SwiftyJSON

class ManagerArticlesJSON {
    
    static let sharedManagerArticlesJSON = ManagerArticlesJSON()
    
    func parseJSON(with data: Any) {
        
        let articlesJSON: JSON = JSON(data)
        guard let numResults = articlesJSON["num_results"].int else {
            fatalError("Cannot get numResults")
        }
        
        guard let results = articlesJSON["results"].array else {
            fatalError("Cannot get results")
        }
        
        for i in 0..<numResults {
            print("IN")
            let articleJSON: JSON = JSON(results[i])
            
            guard let id = articleJSON["id"].int else {
                fatalError("Cannot get id")
            }
            guard let title = articleJSON["title"].string else {
                fatalError("Cannot get title")
            }
            
            
            var arrayImages = Array<String>()
            
            if let mediaMetadata = articleJSON["media"][0]["media-metadata"].array  {
                for i in 0..<mediaMetadata.count {
                    guard let image = mediaMetadata[i]["url"].string else {
                        fatalError("Cannot get image")
                    }
                    arrayImages.append(image)
                }
            }
            
            print(arrayImages)
            
            print(title)
            
            print("OUT")
        }
    }
    
}
