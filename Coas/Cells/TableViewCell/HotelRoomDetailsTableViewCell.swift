//
//  HotelRoomDetailsTableViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 09/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class HotelRoomDetailsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblManagerName: UILabel!
    @IBOutlet weak var lblHotelName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imgProfile.layer.borderColor = UIColor.lightGray.cgColor
        self.imgProfile.layer.borderWidth = 1.0
        self.imgProfile.layer.masksToBounds = true
        self.imgProfile.layer.cornerRadius = self.imgProfile.layer.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
