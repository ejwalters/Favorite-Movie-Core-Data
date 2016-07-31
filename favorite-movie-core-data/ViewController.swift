//
//  ViewController.swift
//  favorite-movie-core-data
//
//  Created by Eric Walters on 7/24/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //testing git
    @IBOutlet weak var tableView: UITableView!
    var wineList = [Wine]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    func fetchAndSetResults() {
        //Getting the application delegate
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Wine")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.wineList = results as! [Wine]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        if let cell = tableView.dequeueReusableCellWithIdentifier("WineCell") as? WineCell {
            let wine = wineList[indexPath.row]
            
            cell.configureCell(wine)
            return cell
        } else {
            return WineCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wineList.count
    }



}

