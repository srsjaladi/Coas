//
//  BookingHistoryTableViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 07/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import RKCardView

class BookingHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var contentsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code/erRadius = 10.0
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
