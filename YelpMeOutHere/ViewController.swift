//
//  ViewController.swift
//  YelpMeOutHere
//
//  Created by Adam Panzer on 2/9/15.
//  Copyright (c) 2015 Adam Panzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var venueList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        venueList.dataSource = self
        venueList.delegate = self
        venueList.layer.borderWidth = 2
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}

