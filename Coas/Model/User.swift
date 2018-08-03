//
//  User.swift
//  Kollectin
//
//  Created by Pablo on 1/7/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import Foundation



class User: NSObject {
    
    var id: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var email:String = ""
    var phone: String = ""
    var image: String = ""
    var coasId : String = ""
	
    
	// For customer of
    init(id: String, firstName: String, lastName: String, email: String,phone: String, image: String, coasId : String ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
		self.email = email
		self.phone = phone
        self.image = image
        self.coasId = coasId
        
    }
	
}
