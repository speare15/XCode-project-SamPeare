//
//  WebViewController.swift
//  Celebrity Chefs
//
//  Created by Samuel Oliver Peare on 03/03/2026.
//

import UIKit
import WebKit
import CoreData

class WebViewController: UIViewController {
    
    //MARK: - Outlets and data
    var chefData : CD_Chef!
    var chefManagedObject : CD_Chef!
    
    @IBOutlet weak var webView: WKWebView!
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let webURL = chefManagedObject.url
        let urlWeb = URL(string: webURL!)
        let webURLRequest = URLRequest(url: urlWeb!)
        webView.load(webURLRequest)
    }

        
    
}
