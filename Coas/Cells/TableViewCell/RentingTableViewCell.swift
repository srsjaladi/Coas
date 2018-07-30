//
//  RentingTableViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 30/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class RentingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblForTitle: UILabel!
    
    @IBOutlet weak var lblForSubTitle: UILabel!
    @IBOutlet weak var imgForRenting: UIImageView!
    
    @IBOutlet weak var lblForPrice: UILabel!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
