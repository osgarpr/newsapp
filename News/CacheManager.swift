//
//  CacheManager.swift
//  News
//
//  Created by Osvaldo Garcia on 10/11/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData (_ url:String, _ imageData:Data) {
        
        //Save the imageData along with the url
        imageDictionary[url] = imageData
    }
    
    static func retreivedData (_ url:String) -> Data? {
        
        //Return the save image data or nil
        return imageDictionary[url]
        
    }
}
