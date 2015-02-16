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
    var vName: String = ""
    var address: NSString = ""
    var categories: String = ""
    var distInMiles: String = ""
    var crossStreets: String = ""
    var neighborhoods: String = ""
    var ratingUrl: NSURL = NSURL()
    var numberOfRatings: Int = 0

    
    init(business: JSON){
        super.init()
        let url = business["image_url"].stringValue
        self.imageUrl = NSURL(string: url)!
        self.vName = business["name"].stringValue
        self.crossStreets = (business["location"]["cross_streets"].stringValue ?? business["location"]["city"].stringValue)
        var address_block = ""
        for (key:String, line:JSON) in business["location"]["display_address"] {
            if(address_block == ""){
                address_block = line.stringValue + "\n"
            }else{
                address_block += line.stringValue + "\n"
            }
            
        }
        self.address = address_block.substringToIndex(address_block.endIndex.predecessor())
        self.neighborhoods = business["location"]["neighborhoods"].stringValue
        let dist = business["distance"].number
        if (dist != nil) {
            var stupidCasting = Double(dist!) * 0.000621371
            self.distInMiles = NSString(format:"%.01f", stupidCasting)
        } else {
            self.distInMiles = "0.0"
        }
        self.ratingUrl = NSURL(string: business["rating_img_url"].stringValue)!
        self.numberOfRatings = business["review_count"].intValue
    }
    
}
