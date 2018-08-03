//
//  Product.swift
//  Kollectin
//
//  Created by Pablo on 1/13/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import Foundation
import SwiftyJSON

private enum UserKeys: String {
    case id = "id"
    case name = "name"
    case image = "image"
  
    
}

class UserInfo {

    var id: String
    var name: String
    var image : String
   
   
    init(object: AnyObject) {
        let json = JSON(object)
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.image = json["image"].stringValue
    }
    
    init() {
        
        self.id = ""
        self.name  = ""
        self.image = ""
    }
    
    func serialize() -> [String: AnyObject]
    {
        return [
            UserKeys.id.rawValue: self.id as AnyObject,
            UserKeys.name.rawValue: self.name as AnyObject,
            UserKeys.image.rawValue: self.image as AnyObject,
        ]
    }
}

func ==(lhs: UserInfo, rhs: UserInfo) -> Bool {
    return
        lhs.id == rhs.id
}

func !=(lhs: UserInfo, rhs: UserInfo) -> Bool {
    return
        lhs.id != rhs.id
}
