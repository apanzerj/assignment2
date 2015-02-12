//
//  ViewController.swift
//  YelpMeOutHere
//
//  Created by Adam Panzer on 2/9/15.
//  Copyright (c) 2015 Adam Panzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate, CLLocationManagerDelegate {

    
    
    @IBOutlet weak var venueList: UITableView!
    @IBOutlet weak var searchNavBarItem: UINavigationItem!
    @IBOutlet weak var searchBar: UISearchBar!

    
    let client: YelpClient! = YelpClient(consumerKey: "-0GKiPla5EC1yPQRVCTjig", consumerSecret: "iNZMX5UFSXLkGk8_s8fw4Se_7QI", accessToken: "QpdUMlAnUHFmex3Lso7eQPbIEpFFnCHp", accessSecret: "xs6r_hZVXuDb_fmCEKob8_GJTUc")

    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        let currentLocation = manager.location
        self.client.searchWithTermAndLocation("Thai", location: currentLocation , success: { (request: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            self.lManager.stopUpdatingLocation()
            self.businessDictionaries = []
            var json = JSON(response)
            let businesses = json["businesses"]
            
            for (id, business) in businesses {
                self.businessDictionaries.append(Venue(business:business))
            }
            self.venueList.reloadData()
            }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println("we broke")
        })

    }

    @IBAction func buttonClicked(sender: AnyObject) {
        if(CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Authorized || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ){
            lManager.requestWhenInUseAuthorization()
            lManager.desiredAccuracy = kCLLocationAccuracyBest
            lManager.startUpdatingLocation()
        }
        self.venueList.reloadData()
    }

    var placeholder: UIImage = UIImage(named: "placeholder.png")!
    var businessDictionaries: [Venue] = []
    var filteredSearch: [Venue] = []
    var lManager: CLLocationManager = CLLocationManager()
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("we borked")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        venueList.dataSource = self
        venueList.delegate = self
        venueList.estimatedRowHeight = 115
        venueList.rowHeight = UITableViewAutomaticDimension
        searchBar.delegate = self
        filteredSearch = businessDictionaries
        lManager.delegate = self
        

        self.client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            var json: JSON = JSON(response)
            let businesses = json["businesses"]
            
            for (id, business) in businesses {
                self.businessDictionaries.append(Venue(business:business))
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
        if tableView == searchDisplayController?.searchResultsTableView {
            return self.filteredSearch.count
        } else {
            return self.businessDictionaries.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var venue: Venue
        if tableView == searchDisplayController?.searchResultsTableView {
            venue = filteredSearch[indexPath.row]
            var cell = venueList.dequeueReusableCellWithIdentifier("searchResultCell") as SearchResultTableViewCell
            cell.resultNameLabel.text = venue.vName
            return cell
        }else{
            venue = businessDictionaries[indexPath.row]
            var cell = venueList.dequeueReusableCellWithIdentifier("aCell") as VenueCell
            cell.venueTitle.text = venue.vName
            cell.venueRatingImage.setImageWithURL(venue.ratingUrl)
            cell.numReviews.text = NSString(format:"%u", venue.numberOfRatings) + " Reviews"
            if(venue.distInMiles != "0.0"){
                cell.distInMiles.text = venue.distInMiles + " Miles"
            }else{
                cell.distInMiles.text = ""
            }
            cell.venueImage.setImageWithURLRequest(NSURLRequest(URL: venue.imageUrl), placeholderImage: self.placeholder, success: { (request: NSURLRequest!, response: NSHTTPURLResponse!, image: UIImage!) -> Void in
                cell.venueImage.image = image
            }, failure: nil)
            cell.venueAddress.text = venue.address
            return cell
        }
    }
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        filteredSearch = searchString.isEmpty ? businessDictionaries : businessDictionaries.filter({(venue: Venue) -> Bool in
            return venue.vName.rangeOfString(searchString, options: .CaseInsensitiveSearch) != nil
        })
        return true
    }

    func filterContentForSearchText(searchText: String) {
        filteredSearch = businessDictionaries.filter({(venue: Venue) -> Bool in
            return venue.vName.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch) != nil
        })
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as FilterViewController
        vc.foo = "asdf"
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    
}

