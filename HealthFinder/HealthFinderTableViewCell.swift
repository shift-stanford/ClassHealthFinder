//
//  HealthFinderTableViewCell.swift
//  HealthFinder
//
//  Created by Bryan McLellan on 10/5/16.
//  Copyright © 2016 Bryan McLellan. All rights reserved.
//

import UIKit

class HealthFinderTableViewCell: UITableViewCell {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
