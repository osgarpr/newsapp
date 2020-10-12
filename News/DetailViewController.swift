//
//  DetailViewController.swift
//  News
//
//  Created by Osvaldo Garcia on 10/11/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import UIKit
import WebKit // Required for Web View

class DetailViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    var articleURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self

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
            
            //Start spinner
            spinner.alpha = 1
            spinner.startAnimating()
            
            //Load it on the webview
            webView.load(request)
        }
        
       
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        //Stop the spinner and hide it
        
        spinner.stopAnimating()
        spinner.alpha = 0
        
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
