//
//  Venue.swift
//  YelpMeOutHere
//
//  Created by Adam Panzer on 2/9/15.
//  Copyright (c) 2015 Adam Panzer. All rights reserved.
//

import UIKit

class Venue: NSObject {
    var imageUrl: NSURL = NSURL()
    var ratingImageUrl: NSURL = NSURL()
    var vName: String = ""
    var numberOfReviews: Int = 0
    var address: NSArray = []
    var categories: String = ""
    var distInMiles: CGFloat = 0.0
    var crossStreets: String = ""
    var neighborhoods: NSArray = []
    
    init(business: NSDictionary){
        super.init()
        var url = business.valueForKeyPath("image_url") as String
        self.imageUrl = NSURL(string: url)!
        self.vName = business.valueForKeyPath("name") as String
        self.crossStreets = business.valueForKeyPath("location.cross_streets") as String
        self.address = business.valueForKeyPath("location.display_address") as NSArray
        self.neighborhoods = business.valueForKeyPath("location.neighborhoods") as NSArray

    }

    
    
}
