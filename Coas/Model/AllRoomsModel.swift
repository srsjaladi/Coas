//
//  ItineraryModel.swift
//  Hello Oman
//
//  Created by Sivaramsingh on 08/07/18.
//  Copyright © 2018 Self. All rights reserved.
//

import Foundation
import SwiftyJSON

class AllRoomsModel {
    
    var book_id: String
    var book_user_id: String
    var book_room_id : String
    var book_date: String
    var book_checkin: String
    var book_checkout : String
    var book_amount: String
    var book_status: String
    var book_em_name : String
    var book_em_phone: String
    var book_type: String
    var book_adults : String
    var book_children: String
    var book_infant: String
    var book_ref : String
    var room_id: String
    var room_name: String
    var room_title : String
    var room_desc: String
    var room_type: String
    var room_PropertyType : String
    var room_HomeType: String
    var room_TotalGuest: String
    var room_BedType : String
    var room_BedroomType: String
    var Sofabed: String
    var Couch : String
    var Floor_mattress: String
    var Single: String
    var select_value : String
    var room_GuestBathroom: String
    var room_Bathroom: String
    var room_country : String
    var room_hangers: String
    var room_state: String
    var room_street : String
    var room_city: String
    var room_zip : String
    var room_apt: String
    var room_latitude: String
    var room_longitude : String
    var room_essential: String
    var room_WirelessNet: String
    var room_shampoo : String
    var room_closet: String
    var room_tv: String
    var room_heat : String
    var room_ac: String
    var room_breakfast: String
    var room_desk : String
    var room_hairdryer: String
    var room_pets_house: String
    var room_private : String
    var room_SmokeDefector: String
    var room_smoke : String
    var room_monoxide: String
    var room_FirsKit: String
    var room_SaftyCard : String
    var room_File_exinguisler: String
    var room_lockbedroom: String
    var room_pool : String
    var room_kitchen: String
    var room_LoundaryWasher: String
    var room_LoundaryDrayer : String
    var room_Parking: String
    var room_elevator: String
    var room_hottub : String
    var room_gym: String
    var room_GovernmentId: String
    var room_RecomendationForm : String
    var room_SuitableChildren: String
    var room_SuitableInfants : String
    var room_SuitablePets: String
    var room_SmokingAllowed: String
    var room_AdditiolnalDetails : String
    var room_CliambStairs: String
    var room_PotentialNoise: String
    var room_PetsProperty : String
    var room_NoParking: String
    var room_PlacesShared: String
    var room_AmenityLimit : String
    var room_sureillance: String
    var room_WeaponsProperty : String
    var room_DangerAnimal: String
    var room_status: String
    var pricepernight : String
    var priceperhour: String
    var room_Approval_status: String
    var room_added_by : String
    var userID : String
    var name : String
    var lastName : String
    var email : String
    var phone : String
    var image : String
    var password : String
    var status : String
    var coasID : String
    var role : String
    var images  = [ImageModel]()
    var bedrooms = [BedRoomModel]()
    var amenities = [AmenitiesModel]()
    
    
    init(object: AnyObject) {
        let json = JSON(object)
        self.book_id =  json["book_id"].stringValue
        self.book_user_id   =  json["book_user_id"].stringValue
        self.book_room_id       =  json["book_room_id"].stringValue
        self.book_date      =  json["book_date"].stringValue
        self.book_checkin      =  json["book_checkin"].stringValue
        self.book_checkout       =  json["book_checkout"].stringValue
        self.book_amount      =  json["book_amount"].stringValue
        self.book_status      =  json["book_status"].stringValue
        self.book_em_name       =  json["book_em_name"].stringValue
        self.book_em_phone      =  json["book_em_phone"].stringValue
        self.book_type      =  json["book_type"].stringValue
        self.book_adults       =  json["book_adults"].stringValue
        self.book_children      =  json["book_children"].stringValue
        self.book_infant      =  json["book_infant"].stringValue
        self.book_ref       =  json["book_ref"].stringValue
        self.room_id      =  json["room_id"].stringValue
        self.room_name      =  json["room_name"].stringValue
        self.room_title       =  json["room_title"].stringValue
        self.room_desc      =  json["room_desc"].stringValue
        self.room_type      =  json["room_type"].stringValue
        self.room_PropertyType       =  json["room_PropertyType"].stringValue
        self.room_HomeType      =  json["room_HomeType"].stringValue
        self.room_TotalGuest      =  json["room_TotalGuest"].stringValue
        self.room_BedType       =  json["room_BedType"].stringValue
        self.room_BedroomType      =  json["room_BedroomType"].stringValue
        self.Sofabed      =  json["Sofabed"].stringValue
        self.Couch       =  json["Couch"].stringValue
        self.Floor_mattress      =  json["Floor_mattress"].stringValue
        self.Single      =  json["Single"].stringValue
        self.select_value       =  json["select_value"].stringValue
        self.room_GuestBathroom      =  json["room_GuestBathroom"].stringValue
        self.room_Bathroom      =  json["room_Bathroom"].stringValue
        self.room_country       =  json["room_country"].stringValue
        self.room_hangers      =  json["room_hangers"].stringValue
        self.room_state      =  json["room_state"].stringValue
        self.room_street       =  json["room_street"].stringValue
        self.room_city      =  json["room_city"].stringValue
        self.room_zip       =  json["room_zip"].stringValue
        self.room_apt      =  json["room_apt"].stringValue
        self.room_latitude      =  json["room_latitude"].stringValue
        self.room_longitude       =  json["room_longitude"].stringValue
        self.room_essential      =  json["room_essential"].stringValue
        self.room_WirelessNet      =  json["room_WirelessNet"].stringValue
        self.room_shampoo       =  json["room_shampoo"].stringValue
        self.room_closet      =  json["room_closet"].stringValue
        self.room_tv      =  json["room_tv"].stringValue
        self.room_heat       =  json["room_heat"].stringValue
        self.room_ac      =  json["room_ac"].stringValue
        self.room_breakfast      =  json["room_breakfast"].stringValue
        self.room_desk       =  json["room_desk"].stringValue
        self.room_hairdryer      =  json["room_hairdryer"].stringValue
        self.room_pets_house      =  json["room_pets_house"].stringValue
        self.room_private       =  json["room_private"].stringValue
        self.room_SmokeDefector      =  json["room_SmokeDefector"].stringValue
        self.room_smoke       =  json["room_smoke"].stringValue
        self.room_monoxide      =  json["room_monoxide"].stringValue
        self.room_FirsKit      =  json["room_FirsKit"].stringValue
        self.room_SaftyCard       =  json["room_SaftyCard"].stringValue
        self.room_File_exinguisler      =  json["room_File_exinguisler"].stringValue
        self.room_lockbedroom      =  json["room_lockbedroom"].stringValue
        self.room_pool       =  json["room_pool"].stringValue
        self.room_kitchen      =  json["room_kitchen"].stringValue
        self.room_LoundaryWasher      =  json["room_LoundaryWasher"].stringValue
        self.room_LoundaryDrayer       =  json["room_LoundaryDrayer"].stringValue
        self.room_Parking      =  json["room_Parking"].stringValue
        self.room_elevator      =  json["room_elevator"].stringValue
        self.room_hottub       =  json["room_hottub"].stringValue
        self.room_gym      =  json["room_gym"].stringValue
        self.room_GovernmentId      =  json["room_GovernmentId"].stringValue
        self.room_RecomendationForm       =  json["room_RecomendationForm"].stringValue
        self.room_SuitableChildren      =  json["room_SuitableChildren"].stringValue
        self.room_SuitableInfants       =  json["room_SuitableInfants"].stringValue
        self.room_SuitablePets      =  json["room_SuitablePets"].stringValue
        self.room_SmokingAllowed      =  json["room_SmokingAllowed"].stringValue
        self.room_AdditiolnalDetails       =  json["room_AdditiolnalDetails"].stringValue
        self.room_CliambStairs      =  json["room_CliambStairs"].stringValue
        self.room_PotentialNoise      =  json["room_PotentialNoise"].stringValue
        self.room_PetsProperty       =  json["room_PetsProperty"].stringValue
        self.room_NoParking      =  json["room_NoParking"].stringValue
        self.room_PlacesShared      =  json["room_PlacesShared"].stringValue
        self.room_AmenityLimit       =  json["room_AmenityLimit"].stringValue
        self.room_sureillance      =  json["room_sureillance"].stringValue
        self.room_WeaponsProperty       =  json["room_WeaponsProperty"].stringValue
        self.room_DangerAnimal      =  json["room_DangerAnimal"].stringValue
        self.room_status      =  json["room_status"].stringValue
        self.pricepernight       =  json["pricepernight"].stringValue
        self.priceperhour      =  json["priceperhour"].stringValue
        self.room_Approval_status      =  json["room_Approval_status"].stringValue
        self.room_added_by       =  json["room_added_by"].stringValue
        self.userID = json["user_id"].stringValue
        self.name = json["name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.email = json["email"].stringValue
        self.phone = json["phone"].stringValue
        self.image = json["image"].stringValue
        self.password = json["password"].stringValue
        self.status = json["status"].stringValue
        self.coasID = json["coas_id"].stringValue
        self.role = json["role"].stringValue
        let imagesArray = json["images"].arrayValue
        for item in imagesArray
        {
            self.images.append(ImageModel(object: item.object as AnyObject))
        }
        let bedRoomsArray = json["bedrooms"].arrayValue
        for item in bedRoomsArray
        {
            self.bedrooms.append(BedRoomModel(object: item.object as AnyObject))
        }
        let amenitiesArray = json["amenities"].arrayValue
        for item in amenitiesArray
        {
            self.amenities.append(AmenitiesModel(json: item.object as AnyObject))
        }
        
        
    }
    
    init() {
        
        self.book_id =  ""
        self.book_user_id      =  ""
        self.book_room_id       =  ""
        self.book_date      =  ""
        self.book_checkin      =  ""
        self.book_checkout       =  ""
        self.book_amount      =  ""
        self.book_status      =  ""
        self.book_em_name       =  ""
        self.book_em_phone      =  ""
        self.book_type      =  ""
        self.book_adults       =  ""
        self.book_children      =  ""
        self.book_infant      =  ""
        self.book_ref       =  ""
        self.room_id      =  ""
        self.room_name      =  ""
        self.room_title       =  ""
        self.room_desc      =  ""
        self.room_type      =  ""
        self.room_PropertyType       =  ""
        self.room_HomeType      =  ""
        self.room_TotalGuest      =  ""
        self.room_BedType       =  ""
        self.room_BedroomType      =  ""
        self.Sofabed      =  ""
        self.Couch       =  ""
        self.Floor_mattress      =  ""
        self.Single      =  ""
        self.select_value       =  ""
        self.room_GuestBathroom      =  ""
        self.room_Bathroom      =  ""
        self.room_country       =  ""
        self.room_hangers      =  ""
        self.room_state      =  ""
        self.room_street       =  ""
        self.room_city      =  ""
        self.room_zip       =  ""
        self.room_apt      =  ""
        self.room_latitude      =  ""
        self.room_longitude       =  ""
        self.room_essential      =  ""
        self.room_WirelessNet      =  ""
        self.room_shampoo       =  ""
        self.room_closet      =  ""
        self.room_tv      =  ""
        self.room_heat       =  ""
        self.room_ac      =  ""
        self.room_breakfast      =  ""
        self.room_desk       =  ""
        self.room_hairdryer      =  ""
        self.room_pets_house      =  ""
        self.room_private       =  ""
        self.room_SmokeDefector      =  ""
        self.room_smoke       =  ""
        self.room_monoxide      =  ""
        self.room_FirsKit      =  ""
        self.room_SaftyCard       =  ""
        self.room_File_exinguisler      =  ""
        self.room_lockbedroom      =  ""
        self.room_pool       =  ""
        self.room_kitchen      =  ""
        self.room_LoundaryWasher      =  ""
        self.room_LoundaryDrayer       =  ""
        self.room_Parking      =  ""
        self.room_elevator      =  ""
        self.room_hottub       =  ""
        self.room_gym      =  ""
        self.room_GovernmentId      =  ""
        self.room_RecomendationForm       =  ""
        self.room_SuitableChildren      =  ""
        self.room_SuitableInfants       =  ""
        self.room_SuitablePets      =  ""
        self.room_SmokingAllowed      =  ""
        self.room_AdditiolnalDetails       =  ""
        self.room_CliambStairs      =  ""
        self.room_PotentialNoise      =  ""
        self.room_PetsProperty       =  ""
        self.room_NoParking      =  ""
        self.room_PlacesShared      =  ""
        self.room_AmenityLimit       =  ""
        self.room_sureillance      =  ""
        self.room_WeaponsProperty       =  ""
        self.room_DangerAnimal      =  ""
        self.room_status      =  ""
        self.pricepernight       =  ""
        self.priceperhour      =  ""
        self.room_Approval_status      =  ""
        self.room_added_by       =  ""
        self.userID = ""
        self.name = ""
        self.lastName = ""
        self.email = ""
        self.phone = ""
        self.image = ""
        self.password = ""
        self.status = ""
        self.coasID = ""
        self.role = ""
        self.images = []
        self.bedrooms = []
        self.amenities = []
    }
}


struct AmenitiesModel
{
    var id = ""
    var roomId = ""
    var amenityId = ""
    var amenity = ""
    var amenityImage = ""
    var isSelected: Bool = false
    
    init() {
        
    }
    
    init(json:AnyObject?) {
        
        if let data = json {
            
            id = data["id"] as? String ?? ""
            roomId = data["room_id"] as? String ?? ""
            amenityId = data["amenity_id"] as? String ?? ""
            amenity = data["amenity"] as? String ?? ""
            amenityImage = data["amenity_image"] as? String ?? ""
            
        }
    }
}


struct BedRoomModel
{
    var bedRoomid = ""
    var roomId = ""
    var bedRoomName : String = ""
    var king = ""
    var queen = ""
    var singleBed : String = ""
    var doubleBed = ""
    var sofabed = ""
    var select_value : String = ""
    var status : String = ""
    
    init() {
        
    }
    
    init(object:AnyObject) {
        
        let json = JSON(object)
        
        self.bedRoomid = json["bedroom_id"].stringValue
        self.roomId = json["room_id"].stringValue
        self.bedRoomName = json["bedroom_name"].stringValue
        self.king = json["king"].stringValue
        self.queen = json["queen"].stringValue
        self.singleBed = json["singlebed"].stringValue
        self.doubleBed = json["doublebed"].stringValue
        self.sofabed = json["sofabed"].stringValue
        self.select_value = json["select_value"].stringValue
        self.status = json["ststus"].stringValue
    }
}

struct ImageModel
{
    var imageId = ""
    var roomId = ""
    var image = ""
    var status = ""
    
    init() {
        
    }
    
    init(object:AnyObject) {
        
        let json = JSON(object)
        
        self.imageId = json["image_id"].stringValue
        self.roomId = json["room_id"].stringValue
        self.image = json["image"].stringValue
        self.status = json["status"].stringValue
        
    }
}




