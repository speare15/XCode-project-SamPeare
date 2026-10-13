//
//  DetailsViewController.swift
//  Person Information
//
//  Created by Samuel Oliver Peare on 10/02/2026.
//

import UIKit
import WebKit
import AVKit
import AVFoundation
import CoreData

class DetailsViewController: UIViewController {
    
    //MARK: - Outlets and data
    var chefData : CD_Chef!
    var chefManagedObject : CD_Chef!
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var restaurantsTextField: UITextField!
    @IBOutlet weak var booksTextField: UITextField!
    @IBOutlet weak var tvTextField: UITextField!
    @IBOutlet weak var cuisineTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    
    @IBOutlet weak var webView: WKWebView!
    //var myView = WKWebView()
    
    /*
    func updateChef(){
        chefData.name = nameTextField.text
        chefData.dob = dobTextField.text
        chefData.restaurants = restaurantsTextField.text
        chefData.books = booksTextField.text
        chefData.tv = tvTextField.text
        chefData.cuisine = cuisineTextField.text
        chefData.url = urlTextField.text
        // context save it
        do{
            try context.save()
        }catch{
            print("CD Context cannot save")
        }
    }*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fill the fields with chefManagedObject data
        if chefManagedObject != nil {
            nameTextField.text = chefManagedObject.name
            dobTextField.text = chefManagedObject.dob
            restaurantsTextField.text = chefManagedObject.restaurants
            booksTextField.text = chefManagedObject.books
            tvTextField.text = chefManagedObject.tv
            cuisineTextField.text = chefManagedObject.cuisine
            urlTextField.text = chefManagedObject.url
        }
        
        
        if let youtube = URL(string: chefManagedObject.video!) {
            let request = URLRequest(url: youtube)
            webView.load(request)
        } else {
            print ("Could not find file to load")
        }
         
    }
        
        
        
        
        
         // MARK: - Navigation

         // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "segue2"{
                 // Get the new view controller using segue.destination.
                let destController = segue.destination as? WebViewController
                destController?.chefManagedObject = chefManagedObject
             }
         }
        
    }

