//
//  PersonViewCell.swift
//  MobilePeopleDirectory
//
//  Created by alejandro soto on 1/24/15.
//  Copyright (c) 2015 Rivet Logic. All rights reserved.
//

import UIKit

class PersonViewCell: UITableViewCell {
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    
    @IBOutlet weak var emailIcon: UIImageView!
    
    
    @IBOutlet weak var phoneIcon: UIImageView!
    
    
    @IBOutlet weak var skypeIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
