//
//  ArrangementsCollectionViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 09/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class ArrangementsCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblType1: UILabel!
    @IBOutlet weak var lblType2: UILabel!
    @IBOutlet weak var lblType3: UILabel!
    
    
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
