//
//  PeopleTableTableViewController.swift
//  Person Information
//
//  Created by Samuel Oliver Peare on 10/02/2026.
//

import UIKit
import CoreData

class ChefTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    var chefsData : Chefs!
    var chefArray : [Chef] = []
    
    // MARK: CORE DATA
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var entity : NSEntityDescription! // cannot have an optional as let
    var chefManagedObject : CD_Chef!
    var frc : NSFetchedResultsController<NSFetchRequestResult>! // frc is what it is usually called
    //var isFavourite : Bool
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chefs"
        self.navigationController!.navigationBar.tintColor  = UIColor.white
        tableView.delegate = self
        
       
        // make the frc and perform fetch
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try frc.performFetch()
        }catch{
            print("frc cannot fetch")
        }
        
        // set up frc delegate
        frc.delegate = self
        
        if frc.sections![0].numberOfObjects > 0 {
            print("You already have objects!")
        } else {
            // make an entity and managed object
            entity = NSEntityDescription.entity(forEntityName: "CD_Chef", in: context)
            
            
            
            // get the chef data in alphabetical order
            chefsData = Chefs(fromXMLFile: "chefs.xml")
            chefArray = arrayOfChefs(data: chefsData)
            
            
            
            for chef in chefArray {
                chefManagedObject = CD_Chef(entity: entity, insertInto: context)
                chefManagedObject.name = chef.name
                chefManagedObject.dob = chef.dob
                chefManagedObject.restaurants = chef.restaurants
                chefManagedObject.books = chef.books
                chefManagedObject.tv = chef.tv
                chefManagedObject.cuisine = chef.cuisine
                chefManagedObject.url = chef.url
                chefManagedObject.image = chef.image
                chefManagedObject.video = chef.video
                
                // context to save
                do {
                    try context.save()
                }catch {
                    print("context cannot save")
                }
                
            }
        }}
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult>{
        // create a request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CD_Chef")
        // give the predicates (anywhere the name can be) if any
        
        // sort the results
        let sorting1 = NSSortDescriptor(key: "name", ascending: true)
        let sorting2 = NSSortDescriptor(key: "dob", ascending: true)
        request.sortDescriptors = [sorting1, sorting2]
        
        return request
    }
            

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
            
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return frc.sections![section].numberOfObjects
    }
            
            
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                
        // get the cell data
        let chefManagedObject = frc.object(at: indexPath) as? CD_Chef
                
        // Configure the cell...
        cell.textLabel?.text = chefManagedObject?.name
        cell.detailTextLabel?.text = chefManagedObject?.dob
        cell.imageView?.image = UIImage(named: (chefManagedObject?.image)!)
             
        return cell
    }
     /*
    func getImage(name:String)-> UIImage {
        //get the image name from the documents
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(name)
        let image = UIImage(contentsOfFile: imagePath)
        
        return image!
    }
     */
            
            
            /*
             // Override to support conditional editing of the table view.
             override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
             // Return false if you do not want the specified item to be editable.
             return true
             }
             */
//            
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // get from frc the object to delete
            chefManagedObject = frc.object(at: indexPath) as? CD_Chef
            // context deletes the object
            context.delete(chefManagedObject)
            // context saves
            do{
                try context.save()
            }catch{
                print("context could not save")
            }
            // eventually reload
        }
    }
//            
            /*
             // Override to support rearranging the table view.
             override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
             
             }
             */
            
            /*
             // Override to support conditional rearranging of the table view.
             override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
             // Return false if you do not want the item to be re-orderable.
             return true
             }
             */
            
            
            // MARK: - Navigation
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue0" {
                    
                let destController = segue.destination as? ChefViewController
                    
                //get indexPath
                let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
                    
                //extract the object to pass from frc
                chefManagedObject = frc.object(at: indexPath!) as? CD_Chef
                    
                //Pass the selected object to the new view controller
                destController?.chefManagedObject = chefManagedObject
            }
        }
    func arrayOfChefs(data: Chefs) -> [Chef] {
        var countdown = data.getCount()
        var chefArray : [Chef] = []
        while countdown > 0 {
            chefArray.append(data.getChef(index: countdown - 1))
            countdown -= 1
        }
        
        return chefArray
    }
            
}
    
