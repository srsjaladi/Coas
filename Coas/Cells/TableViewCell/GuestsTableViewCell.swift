//
//  GuestsTableViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 11/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class GuestsTableViewCell: UITableViewCell {

    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldPhoneNum: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
