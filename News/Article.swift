//
//  Article.swift
//  News
//
//  Created by Osvaldo Garcia on 10/11/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import Foundation

struct Article : Decodable{
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
}
