//
//  ArticleCell.swift
//  News
//
//  Created by Osvaldo Garcia on 10/11/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var headlineLabel: UILabel!
    
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay:Article?
    
    func displayArticle(_ article:Article) {
        
        //Cleanup the Cell before displaying another article
        articleImageView.image = nil
        articleImageView.alpha = 0
        headlineLabel.text = ""
        headlineLabel.alpha = 0
        
        //Keep a reference to the article
        articleToDisplay = article
        
        //Set the headline
        headlineLabel.text = articleToDisplay!.title
        
        //Animate the label into view
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            
            self.headlineLabel.alpha = 1
            
        }, completion: nil)
        
        //Download and display the image
        
        //Check that the articule actually have an image
        guard articleToDisplay!.urlToImage != nil else {
            return
        }
        
        //Create url string
        let urlString = articleToDisplay!.urlToImage!
        
        //Check the cacheManager before download data
        if let imageData = CacheManager.retreivedData(urlString) {
            
            //There is image data set the imageView and return
            articleImageView.image = UIImage(data: imageData)
            
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                
                self.articleImageView.alpha = 1
                
            }, completion: nil)
            
            return
            
        }
        
        //Create url
        let url = URL(string: urlString)
        
        //Check that the url isn't nil
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        //Get a url session
        let session = URLSession.shared
        
        //Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check that there were no errors
            if error == nil && data != nil {
                
                //Save the data into cache
                CacheManager.saveData(urlString, data!)
                
                if self.articleToDisplay!.urlToImage == urlString {
                    
                    DispatchQueue.main.async {
                    
                        //display the image data in the imageView
                        self.articleImageView.image = UIImage(data: data!)
                        
                        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                            
                            self.articleImageView.alpha = 1
                            
                        }, completion: nil)
                    
                    
                    }
                }
            }
        }
        
        //Kickoff the data task
        dataTask.resume()
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
