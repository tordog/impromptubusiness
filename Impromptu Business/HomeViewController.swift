//
//  HomeViewController.swift
//  Impromptu Business
//
//  Created by Torie Nielsen on 4/29/15.
//  Copyright (c) 2015 impromptu. All rights reserved.
//

import Foundation
import UIKit
import Parse
import CoreLocation

class HomeViewController: UIViewController {
    
    @IBAction func logout(sender: AnyObject) {
    self.performSegueWithIdentifier("logoutFromHome", sender: self)
    }
    
    @IBAction func viewCurrentDeals(sender: AnyObject) {
        self.performSegueWithIdentifier("homeToCurrentDeals", sender: self)
    }
    @IBAction func createDeal(sender: AnyObject) {
        self.performSegueWithIdentifier("homeToCreateDeal", sender: self)
        
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

