//
//  VenueCell.swift
//  YelpMeOutHere
//
//  Created by Adam Panzer on 2/9/15.
//  Copyright (c) 2015 Adam Panzer. All rights reserved.
//

import UIKit

class VenueCell: UITableViewCell {

    @IBOutlet weak var venueAddress: UILabel!
    @IBOutlet weak var venueImage: UIImageView!
    @IBOutlet weak var distInMiles: UILabel!
    @IBOutlet weak var numReviews: UILabel!
    @IBOutlet weak var venueRatingImage: UIImageView!
    @IBOutlet weak var venueCrossStreets: UILabel!
    @IBOutlet weak var venueTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
