//
//  Model.swift
//  NYTimes
//
//  Created by Lilia on 8/17/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import Foundation

struct ArticleModel {
    
    var id: Int
    var title: String
    var abstract: String
    var image: String
    var url: URL?
    var isSelected = false
    
}
