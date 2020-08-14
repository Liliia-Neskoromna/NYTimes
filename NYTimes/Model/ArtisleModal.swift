//
//  ArtisleModel.swift
//  TestForVRGSoft
//
//  Created by Lilia on 8/14/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import Foundation

struct Article: Decodable {
    var id: Int
    var title: String
    var publishedDate: String
    var media: [ArticleMedia]
}

struct ArticleMedia: Decodable {
    var mediaMetadata: [ArticleMediaMetadata]
}

struct ArticleMediaMetadata: Decodable {
    var url: String
    var format: String
}
    
//    
//    func mapToDataCell() -> ArticleModel {
//        
//        
//        return ArticleModel
//    }

