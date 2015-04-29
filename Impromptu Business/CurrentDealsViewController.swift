//
//  CurrentDealsViewController.swift
//  Impromptu Business
//
//  Created by Torie Nielsen on 4/29/15.
//  Copyright (c) 2015 impromptu. All rights reserved.
//

import Foundation
import UIKit
import Parse
import CoreLocation

class CurrentDealsViewController: UIViewController {
    

    @IBAction func back(sender: AnyObject) {
        self.performSegueWithIdentifier("currentDealsToHome", sender: self)
    }
    
    @IBAction func endDeal(sender: AnyObject) {
        self.performSegueWithIdentifier("currentDealsToHome", sender: self)
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

