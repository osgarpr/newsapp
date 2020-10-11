//
//  ViewController.swift
//  News
//
//  Created by Osvaldo Garcia on 10/11/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ArticleModelProtocol, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Get a Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        //Get the article that the tableView is asking about
        let article = articles[indexPath.row]
        
        //Customize it
        cell.displayArticle(article)
        
        //Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = ArticleModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the view controller as the delegate and datasource of the tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Get the articles from the model
        model.delegate = self
        model.getArticles()
        
        
    }
    
    //MARK: -Article Model Protocol Methods
    
    func articlesRetrieved(_ articles: [Article]) {
        
        //set the articles on the model to the article on the View Controller
        self.articles = articles
        
        //Refresh the tableView
        tableView.reloadData()
        
    }


}

