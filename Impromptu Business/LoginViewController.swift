//
//  LoginViewController.swift
//  Impromptu Business
//
//  Created by Torie Nielsen on 4/29/15.
//  Copyright (c) 2015 impromptu. All rights reserved.
//

import Foundation
import UIKit
import Parse
import CoreLocation

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func login(sender: AnyObject) {
        let data: NSDictionary = [
            "email": self.email.text,
            "password": self.password.text,
        ]
        self.performSegueWithIdentifier("loginToHome", sender: self)
    }
    
    @IBAction func register(sender: AnyObject) {
        self.performSegueWithIdentifier("loginToRegister", sender: self)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

