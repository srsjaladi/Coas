//
//  RentingTableViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 30/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class RentingTableViewCell: UITableViewCell {

    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var lblForTitle: UILabel!
    @IBOutlet weak var lblForSubTitle: UILabel!
    @IBOutlet weak var imgForRenting: UIImageView!
    @IBOutlet weak var lblForPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentsView.layer.cornerRadius = 10.0
        self.contentsView.clipsToBounds = true
        self.contentsView.layer.borderWidth = 1.0
        self.contentsView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentsView.layer.masksToBounds = false
        self.contentsView.layer.shadowOffset = CGSize(width:0, height:3)
        self.contentsView.layer.shadowColor = UIColor.black.cgColor
        self.contentsView.layer.shadowOpacity = 0.23
        self.contentsView.layer.shadowRadius = 4

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
