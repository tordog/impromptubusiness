//
//  CreateDealViewController.swift
//  Impromptu Business
//
//  Created by Torie Nielsen on 4/29/15.
//  Copyright (c) 2015 impromptu. All rights reserved.
//

import Foundation
import UIKit
import Parse
import CoreLocation

class CreateDealViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var lowestPrice: UITextField!
    
    @IBOutlet weak var dealDescription: UITextView!
   
    @IBOutlet weak var dealName: UITextField!
    
    @IBOutlet weak var startPrice: UITextField!
    
    @IBOutlet weak var originalPrice: UITextField!
    
    @IBOutlet weak var startDate: UIDatePicker!
    
    @IBOutlet weak var endTime: UIDatePicker!
    
    @IBOutlet weak var quantity: UITextField!
    
    @IBAction func cancel(sender: AnyObject) {
    self.performSegueWithIdentifier("createDealToHome", sender: self)
    }
    
    @IBAction func createDeal(sender: AnyObject) {
        let data: NSDictionary = [
            "name": self.dealName.text,
            "description": self.dealDescription.text,
            "startPrice": self.startPrice.text,
            "lowestPrice": self.lowestPrice.text,
            "originalPrice": self.originalPrice.text,
            "startDate": self.startDate.date,
            "endTime": self.endTime.date,
            "quantity": self.quantity.tag,
            "photo": self.photoID
        ]
        
    self.performSegueWithIdentifier("createDealToHome", sender: self)

    }
    @IBOutlet weak var photo: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var photoID = ""
    
    @IBAction func pick_photo(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            println("Button capture")
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        uploadImageParse(image)
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func uploadImageParse(image: UIImage) {
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        let imageFile = PFFile(data: imageData)
        
        var userPhoto = PFObject(className:"UserPhoto")
        userPhoto["imageName"] = "businessphoto"
        userPhoto["imageFile"] = imageFile
        userPhoto.saveInBackgroundWithBlock { (success, error) -> Void in
            if (success) {
                let id = userPhoto.objectId
                self.photoID = id!
                println("uploaded id \(id)")
                self.getImageParse(id!)
            } else {
                println("error \(error)")
            }
        }
        
    }
    func getImageParse(id: String) {
        var query = PFQuery(className: "UserPhoto")
        query.getObjectInBackgroundWithId(id, block: { (event, error) -> Void in
            if error == nil {
                var imageFile = event?.objectForKey("imageFile") as! PFFile
                imageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if (error == nil) {
                        
                        let image = UIImage(data: imageData!)
                        self.photo.image = image
                    }
                })
            } else {
                println("error \(error)")
            }
        })
    }
}

