//
//  ArticleModel.swift
//  News
//
//  Created by Osvaldo Garcia on 10/11/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(_ articles:[Article])
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        
        //Fire off the request to the api
        
        //Create a string URL
        let stringUrl = "http://newsapi.org/v2/everything?q=apple&sortBy=popularity&apiKey=3eee11a7023046c0ac3d3c08194549dd"
        
        //Create a URL Object
        let url = URL(string:stringUrl)
        
        //Check that it isn't Nil
        guard url != nil else {
            print("Couldn't create URL object")
            return
        }
        //Create the URL Session
        let session = URLSession.shared
        
        //Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check that there is no error and there is data
            if error == nil && data != nil {
                
                //Attempt to parse the Json
                let decoder = JSONDecoder()
                
                do {
                    
                    //Parse the JSON into articleService
                    let articlesService = try decoder.decode(ArticleService.self, from: data!)
                    
                    //Get the articles
                    let articles = articlesService.articles!
                    
                    //Pass it back to the view controller main thread
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles)
                    }
                    
                }
                
                catch {
                    print("Error parsing the JSON")
                    
                } // End Do
                  
            } // End if
            
        } //End dataTask
        
        //Start the data task
        dataTask.resume()
        
    }
}
