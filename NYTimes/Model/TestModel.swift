////
////  TestModel.swift
////  NYTimes
////
////  Created by Lilia on 8/15/20.
////  Copyright © 2020 Liliia. All rights reserved.
////
//
//import Foundation
//
//struct Articles: Decodable {
//    let articles: [Article]
//}
//
//struct Article: Decodable {
//    var id: Int
//    var title: String
//    var media: [ArticleMedia]
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case title = "title"
//        case media = "media"
//    }
//    
//}
//
//struct ArticleMedia: Decodable {
//    var mediaMetadata: [ArticleMediaMetadata]
//    
//    
//}
//
//struct ArticleMediaMetadata: Decodable {
//    var url: String
//    
//}
//
