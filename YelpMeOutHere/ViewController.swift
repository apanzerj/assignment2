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

    let yelpConsumerKey = "-0GKiPla5EC1yPQRVCTjig"
    let yelpConsumerSecret = "iNZMX5UFSXLkGk8_s8fw4Se_7QI"
    let yelpToken = "QpdUMlAnUHFmex3Lso7eQPbIEpFFnCHp"
    let yelpTokenSecret = "xs6r_hZVXuDb_fmCEKob8_GJTUc"

    var client: YelpClient!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        venueList.dataSource = self
        venueList.delegate = self
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

