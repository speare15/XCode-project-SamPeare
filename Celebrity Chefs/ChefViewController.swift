//
//  ViewController.swift
//  Celebrity Chefs
//
//  Created by Samuel Oliver Peare on 27/02/2026.
//

import UIKit
import CoreData

class ChefViewController: UIViewController {

    //MARK: - Outlets and Action and Data
    
    var chefData : CD_Chef!
    var chefManagedObject : CD_Chef!
    
    @IBOutlet weak var chefImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func detailsAction(_ sender: Any) {
    }
    
    @IBOutlet weak var moreLabel: UILabel!
    
    @IBAction func favAction(_ sender: Any) {
        if favSwitch.isOn{
            favLabel.text = "Click to remove from favorites ->"
            chefManagedObject.favorite = true
        } else {
            favLabel.text = "Click to add to favorites"
            chefManagedObject.favorite = false
        }
    }
    
    @IBOutlet weak var favLabel: UILabel!
    
    
    @IBOutlet weak var favSwitch: UISwitch!
    //MARK: - user vars and methods
    
    override func viewWillAppear(_ animated: Bool) {
        moreLabel.center.x -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.5, delay: 1.5, options:
        [.repeat, .autoreverse], animations: {
            self.chefImageView.frame.size.height += 20
            self.chefImageView.frame.size.width += 20
        }, completion: nil)
        UIView.animate(withDuration: 3.5, delay: 0.5,
        usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2,
        options: [.repeat, .autoreverse], animations: {
            self.moreLabel.center.x += self.view.bounds.width
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // get peopleData
        chefImageView.image = UIImage(named: chefManagedObject.image!)
        nameLabel.text = chefManagedObject.name


    }
    
    

    
    // MARK: - Navigation
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"{
            // Get the new view controller using segue.destination.
            let destinationController = segue.destination as! DetailsViewController
            // Pass the selected object to the new view controller.
            destinationController.chefManagedObject = chefManagedObject
        }
    }


}

