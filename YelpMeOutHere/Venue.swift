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
    var vAddress: String = ""
    var categories: String = ""
    var distInMiles: CGFloat = 0.0
    
    init(business: NSDictionary){
        super.init()
        var url = business.valueForKeyPath("image_url") as String
        self.imageUrl = NSURL(string: url)!
        
        self.vName = business.valueForKeyPath("name") as String
    }

    
    
}
