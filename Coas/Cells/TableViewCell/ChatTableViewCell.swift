//
//  ChatTableViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 30/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var ImgUser: UIImageView!
    @IBOutlet weak var lblForLastSeen: UILabel!
    @IBOutlet weak var imgForStatus: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
