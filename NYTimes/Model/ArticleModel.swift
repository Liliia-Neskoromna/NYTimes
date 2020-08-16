//
//  ArtisleModel.swift
//  TestForVRGSoft
//
//  Created by Lilia on 8/14/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Article: Decodable {
    
    var id: Int
    var title: String
    var image: String

}

struct InnerArticle {
    var innerId: Int
    var innerTitle: String
    var innerImage: String
}




//struct Articles: Decodable {
//    var results: [Article]
//}
//
//struct Article: Decodable {
//
//    //var id: Float
//    var title: String
//    var media: [ArticleMedia]
//}
//
//struct ArticleMedia: Decodable {
//    var mediaMetadata: [ArticleMediaMetadata]
//}
//
//struct ArticleMediaMetadata: Decodable {
//    var url: String
//}
//
//
//    func mapToDataCell() -> ArticleModel {
//
//
//        return ArticleModel
//    }

