//
//  ViewController.swift
//  YelpMeOutHere
//
//  Created by Adam Panzer on 2/9/15.
//  Copyright (c) 2015 Adam Panzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var venueList: UITableView!
    @IBOutlet weak var searchNavBarItem: UINavigationItem!
    @IBOutlet weak var searchBar: UISearchBar!

    let yelpConsumerKey = "-0GKiPla5EC1yPQRVCTjig"
    let yelpConsumerSecret = "iNZMX5UFSXLkGk8_s8fw4Se_7QI"
    let yelpToken = "QpdUMlAnUHFmex3Lso7eQPbIEpFFnCHp"
    let yelpTokenSecret = "xs6r_hZVXuDb_fmCEKob8_GJTUc"

    var client: YelpClient!
    var businessDictionaries: [Venue] = []
    var filteredSearch: [Venue] = []
    var isFiltered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        venueList.dataSource = self
        venueList.delegate = self
        
        searchNavBarItem.titleView = searchBar
        searchBar.delegate = self
        

        
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
        if isFiltered {
            return self.filteredSearch.count
        } else {
            return self.businessDictionaries.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = venueList.dequeueReusableCellWithIdentifier("aCell") as VenueCell
        var venue: Venue
        if isFiltered {
            venue = filteredSearch[indexPath.row]
        } else {
            venue = businessDictionaries[indexPath.row]
        }
        cell.venueTitle.text = venue.vName
        cell.venueCrossStreets.text = venue.crossStreets
        return cell
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.filterContentForSearchText(searchBar.text)
        self.venueList.reloadData()
    }
    func filterContentForSearchText(searchText: String) {
        if(searchText == ""){
            self.isFiltered = false
        }else{
            self.isFiltered = true
            self.filteredSearch = self.businessDictionaries.filter({(venue: Venue) -> Bool in
                return venue.vName.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch) != nil
            })
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText)
        self.venueList.reloadData()
    }
    
}

