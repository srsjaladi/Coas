//
//  User+Serializable.swift
//  Kollectin
//
//  Created by Pablo on 1/12/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import Foundation
import SwiftyJSON

private enum Keys: String {
    case id = "user_id"
    case firstName = "first_name"
    case lastName = "last_name"
    case email = "email"
    case phone = "phone"
    case image = "image"
    case coasId = "coas_id"

}

extension User {
    
    static func deserialize(_ dictionary: [String: AnyObject]) -> User?
    {
        if let id = dictionary[Keys.id.rawValue] as? String
        {
            let firstName = dictionary[Keys.firstName.rawValue] as? String ?? ""
            let lastName = dictionary[Keys.lastName.rawValue] as? String ?? ""
            let email = dictionary[Keys.email.rawValue] as? String ?? ""
            let phone = dictionary[Keys.phone.rawValue] as? String ?? ""
            let image = dictionary[Keys.image.rawValue] as? String ?? ""
            let coasId = dictionary[Keys.coasId.rawValue] as? String ?? ""
            
            return User(id: id,firstName: firstName, lastName: lastName, email: email, phone: phone, image: image, coasId: coasId)
        }
        else
        {
            return nil
        }
    }
    
    
    func serialize() -> [String: AnyObject]
    {
        return [
            Keys.id.rawValue: self.id as AnyObject,
            Keys.firstName.rawValue: self.firstName as AnyObject,
            Keys.lastName.rawValue: self.lastName as AnyObject,
            Keys.email.rawValue: self.email as AnyObject,
            Keys.phone.rawValue: self.phone as AnyObject,
            Keys.image.rawValue: self.image as AnyObject,
            Keys.coasId.rawValue: self.coasId as AnyObject
        ]
    }
    
}
