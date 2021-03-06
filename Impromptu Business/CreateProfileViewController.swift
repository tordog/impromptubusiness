//
//  ViewController.swift
//  Impromptu Business
//
//  Created by Torie Nielsen on 4/26/15.
//  Copyright (c) 2015 impromptu. All rights reserved.
//

import UIKit
import Parse
import CoreLocation

class CreateProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var company_name: UITextField!
    
    @IBOutlet weak var category: UITextField!
    
    @IBOutlet weak var location: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var photo: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var photoID = ""
    
    @IBAction func createProfile(sender: AnyObject) {
  
        let address = location.text
        
        CLGeocoder().geocodeAddressString(address, completionHandler: { (placemarks, error) -> Void in
            
            if error == nil {
                let placemark = placemarks[0] as! CLPlacemark
                let data: NSDictionary = [
                    "location": [
                        "latitude": placemark.location.coordinate.latitude,
                        "longitude": placemark.location.coordinate.longitude
                    ],
                    "name": self.company_name.text,
                    "category": self.category.text,
                    "phone": self.phone.text,
                    "photo": self.photoID,
                    "address": address
                ]
            }
        })
        
        self.performSegueWithIdentifier("backtoHome", sender: self)
        
    }
    
    @IBAction func pick_photo(sender: AnyObject) {
        println(company_name.text)
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

