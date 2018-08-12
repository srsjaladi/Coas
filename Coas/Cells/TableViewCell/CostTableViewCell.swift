//
//  CostTableViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 09/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class CostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var btnHour: UIButton!
    @IBOutlet weak var btnNight: UIButton!
    @IBOutlet weak var lblHour: UILabel!
    @IBOutlet weak var lblNight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblHour.layer.borderColor = UIColor.lightGray.cgColor
        self.lblHour.layer.borderWidth = 1.0
        self.lblNight.layer.borderColor = UIColor.lightGray.cgColor
        self.lblNight.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
