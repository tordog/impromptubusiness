//
//  ViewController.swift
//  Impromptu Business
//
//  Created by Torie Nielsen on 4/26/15.
//  Copyright (c) 2015 impromptu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dealName = ["Shakeshack Burger + Fries", "Mani-Pedi", "Custard + Fries", "Sushi Platter"]
    
    
    var startPrice = ["10.00", "30.00", "10.00", "20.00"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dealName.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        
        
        cell.textLabel?.text=dealName[indexPath.row]
        cell.textLabel?.textColor=UIColor.redColor()
        
        cell.detailTextLabel?.text=dealName[indexPath.row]
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    

}

