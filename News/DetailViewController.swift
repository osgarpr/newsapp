//
//  DetailViewController.swift
//  News
//
//  Created by Osvaldo Garcia on 10/11/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import UIKit
import WebKit // Required for Web View

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var articleURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Check that there is a url
        if articleURL != nil {
            
            //Create the url object
            let url = URL(string: articleURL!)
            
            guard url != nil else {
                //Couldnt create the url object
                return
            }
            
            //Create the URLrequest object
            let request = URLRequest(url: url!)
            
            //Load it on the webview
            webView.load(request)
        }
        
       
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
