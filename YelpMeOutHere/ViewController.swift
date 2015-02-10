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
    var businessDictionaries: [Venue] = []
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        venueList.dataSource = self
        venueList.delegate = self
        
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            var businesses = response["businesses"] as [NSDictionary]
            for business in businesses {
                self.businessDictionaries.append(Venue(business: business))
            }
            self.venueList.reloadData()
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
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
        return businessDictionaries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = venueList.dequeueReusableCellWithIdentifier("aCell") as VenueCell
        cell.venueTitle.text = businessDictionaries[indexPath.row].vName
        return cell
    }


}

