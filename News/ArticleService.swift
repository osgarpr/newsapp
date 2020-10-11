//
//  ArticleService.swift
//  News
//
//  Created by Osvaldo Garcia on 10/11/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import Foundation

struct ArticleService : Decodable {
    var totalResults:Int?
    var articles:[Article]?
}
