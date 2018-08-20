//
//  AddedRoomCollectionViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 17/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class AddedRoomCollectionViewCell: UICollectionViewCell {

     @IBOutlet weak var contentsView: UIView!
    
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

}
