//
//  SearchResultTableViewCell.swift
//  YelpMeOutHere
//
//  Created by Adam Panzer on 2/10/15.
//  Copyright (c) 2015 Adam Panzer. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var resultNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}