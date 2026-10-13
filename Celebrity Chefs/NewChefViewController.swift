//
//  NewChefViewController.swift
//  Celebrity Chefs
//
//  Created by Samuel Oliver Peare on 31/03/2026.
//

import UIKit
import CoreData

class NewChefViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    //MARK: Core data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var entity : NSEntityDescription!
    var chefManagedObject : CD_Chef!
    
    func newChef(){
        
        // make a new personManagedObject
        entity = NSEntityDescription.entity(forEntityName: "CD_Chef", in: context)
        chefManagedObject = CD_Chef(entity: entity, insertInto: context)
        
        //get its data from fields
        chefManagedObject.name  = nameTF.text
        chefManagedObject.dob = dobTF.text
        chefManagedObject.restaurants = restaurantsTF.text
        chefManagedObject.books = booksTF.text
        chefManagedObject.tv = tvTF.text
        chefManagedObject.cuisine = cuisineTF.text
        chefManagedObject.url = urlTF.text
        chefManagedObject.image = imageTF.text
        chefManagedObject.video = videoTF.text
        
        // context save it
        do{
            try context.save()
        }catch{
            print("CD Context cannot save")
        }
    }
    
    func updateChef(){
        
        //get its data from fields
        chefManagedObject.name  = nameTF.text
        chefManagedObject.dob = dobTF.text
        chefManagedObject.restaurants = restaurantsTF.text
        chefManagedObject.books = booksTF.text
        chefManagedObject.tv = tvTF.text
        chefManagedObject.cuisine = cuisineTF.text
        chefManagedObject.url = urlTF.text
        chefManagedObject.image = imageTF.text
        chefManagedObject.video = videoTF.text
        
        // context save it
        do{
            try context.save()
        }catch{
            print("CD Context cannot save")
        }
        
        let image = pickedImageView.image
        if image != nil && chefManagedObject.image != nil {
            putImage(name: chefManagedObject.image!)
        }
    }
    
    //MARK:  Outlets and Actions
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var restaurantsTF: UITextField!
    @IBOutlet weak var booksTF: UITextField!
    @IBOutlet weak var tvTF: UITextField!
    @IBOutlet weak var cuisineTF: UITextField!
    @IBOutlet weak var urlTF: UITextField!
    @IBOutlet weak var imageTF: UITextField!
    @IBOutlet weak var videoTF: UITextField!
    
    @IBOutlet weak var pickedImageView: UIImageView!
    
    @IBAction func pickedImageAction(_ sender: Any) {
        //create the picker
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        // call new or update
        if chefManagedObject == nil{
            newChef()
        }else{
            updateChef()
        }
        // go back to table
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - picker and image methods
    let imagePicker = UIImagePickerController()
    
    // get image function
    func getImage(name:String) {
        //get the image name from documents
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(name)
        let image = UIImage(contentsOfFile: imagePath)
                            
        pickedImageView.image = image
    }
    //put image function
    func putImage(name:String) {
        //get image from documents
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(name)
        //get the file manager
        let fn = FileManager.default
        //get the image from pickedImageView and generate data
        let image = pickedImageView.image
        let data = image?.pngData()
        //use the fn to save the image data
        fn.createFile(atPath: imagePath, contents: data)
        
    }
    
    // picker delegate functions
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // get the image from info
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        // place it into the image view
        pickedImageView.image = image
        // dismiss
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fill the fields with chefManagedObject data
        if chefManagedObject != nil{
            nameTF.text = chefManagedObject.name
            dobTF.text = chefManagedObject.dob
            restaurantsTF.text = chefManagedObject.restaurants
            booksTF.text = chefManagedObject.books
            tvTF.text = chefManagedObject.tv
            cuisineTF.text = chefManagedObject.cuisine
            urlTF.text = chefManagedObject.url
            imageTF.text = chefManagedObject.image
            videoTF.text = chefManagedObject.video
        }
    }
    
    
    
}
