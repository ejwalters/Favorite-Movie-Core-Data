//
//  CreateWineVC.swift
//  favorite-movie-core-data
//
//  Created by Eric Walters on 7/31/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import UIKit
import CoreData

class CreateWineVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var wineTitle: UITextField!
    @IBOutlet weak var wineDesc: UITextField!
    @IBOutlet weak var wineUrl: UITextField!
    @IBOutlet weak var wineImage: UIImageView!
    @IBOutlet weak var addWineButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        wineImage.layer.cornerRadius = 4.0
        wineImage.clipsToBounds = true
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        wineImage.image = image
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createWine(sender: AnyObject!) {
        if let title = wineTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Wine", inManagedObjectContext: context)!
            let wine = Wine(entity: entity, insertIntoManagedObjectContext: context)
            wine.title = title
            wine.descript = wineDesc.text
            wine.setWineImage(wineImage.image!)
            
            context.insertObject(wine)
            
            do {
                try context.save()
            } catch {
                print("Could not save wine!")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    
}
