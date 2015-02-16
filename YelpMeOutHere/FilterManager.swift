//
//  FilterManager.swift
//  YelpMeOutHere
//
//  Created by Adam Panzer on 2/11/15.
//  Copyright (c) 2015 Adam Panzer. All rights reserved.
//

import UIKit

class FilterManager: NSObject {
    var labelName: String = ""
    var labelOptions:NSArray = []

    func distances() -> NSArray{
        return ["1 Mile", "2 Miles", "5 Miles"]
    }
    
    func sort_types() -> NSArray{
        return ["Rating", "Distance", "# of Reviews"]
    }
    
    func categories_i_like() -> NSArray{
        return ["Pizza", "Burgers", "Sushi"]
    }
    
    func filters() -> NSArray{
        return ["Categories", "Sorting", "Distances"]
    }
}
