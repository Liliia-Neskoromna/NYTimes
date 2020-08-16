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
    var allArticlesId = [Int]()
    var allArticlesTitle = [String]()
    var allArticlesImages = [String]()
    
    var arrayOfArticles = [Article]()
    
    func parseJSON(with data: Any) -> [Article] {
        
        let articlesJSON: JSON = JSON(data)
        guard let numResults = articlesJSON["num_results"].int else {
            fatalError("Cannot get numResults")
        }
        
        guard let results = articlesJSON["results"].array else {
            fatalError("Cannot get results")
        }
        self.allArticlesId.removeAll()
        self.allArticlesTitle.removeAll()
        self.allArticlesImages.removeAll()
        for i in 0..<numResults {
            
            let articleJSON: JSON = JSON(results[i])
            
            guard let id = articleJSON["id"].int else {
                fatalError("Cannot get id")
            }
            self.allArticlesId.append(id)
            
            guard let title = articleJSON["title"].string else {
                fatalError("Cannot get title")
            }
            self.allArticlesTitle.append(title)
            
            let mediaMetadata = articleJSON["media"][0]["media-metadata"]
            
            for i in mediaMetadata.arrayValue {
                guard let image = i["url"].string else {
                    fatalError("Cannot get image")
                }
                allArticlesImages.append(image)
            }
            
            //let item = Article(json: articleJSON)
            let item = Article(id: allArticlesId[i], title: allArticlesTitle[i], image: allArticlesImages[i])
            arrayOfArticles.append(item)
            //print(arrayOfArticles)
        }
        
        return arrayOfArticles
    }
    
    //    func mapToArticles() -> Article {
    //
    //        for element in
    //
    //        let id =
    //        let title = allArticlesTitle[0]
    //        let image = allArticlesImages[0]
    //        let mediaMetadata = ArticleMediaMetadata(url: image)
    //        let media = ArticleMedia(mediaMetadata: [mediaMetadata])
    //
    //        let item = Article(id: id, title: title, media: [media])
    //
    //        for i in 0..<allArticlesId.count {
    //            let id = allArticlesId[i]
    //            let title = allArticlesTitle[i]
    //            let image = allArticlesImages[i]
    
    //            //var mediaMetadata = ArticleMediaMetadata(url: image)
    //
    //            var media = [ArticleMedia]()
    //
    //            for each in media {
    //                var mediaMetadata = [ArticleMediaMetadata]()
    //
    //                for each in mediaMetadata {
    //                    let url = each.url
    //
    //                    let newMediaMetadata = ArticleMediaMetadata(url: url)
    //                    mediaMetadata.append(newMediaMetadata)
    //                }
    //
    //                var newMediaMetadata = each.mediaMetadata
    //
    //                let newMedia = ArticleMedia(mediaMetadata: newMediaMetadata)
    //                media.append(newMedia)
    //            }
    //            let item: Article = Article(id: id, title: title, media: media)
    //            //                print(item)
    //            //                return item
    //        }
    //
    //        return item
    //        print(item)
    //    }
    //}
}


