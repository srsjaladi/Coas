//
//  KollectinAPI.swift
//  Kollectin
//
//  Created by Pablo on 1/4/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private struct Strings{
    static let TOKEN_HEADER_KEY = "x-access-token"
    static let CONTENT_TYPE = "Content-Type"
    
}

private struct ContentTypes {

    static let applicationJSON = "application/json"
}

class CoasAPI {

    static let sharedInstance = CoasAPI()
    fileprivate let alamoFireManager : Alamofire.SessionManager!
    
    init(){
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20 // seconds
        configuration.timeoutIntervalForResource = 20
        self.alamoFireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    fileprivate func getStatusCodeFrom(_ response: DataResponse<Any>  ) -> Int {
        if let httpError = response.result.error?._code {
            return httpError
        } else {
            return (response.response?.statusCode)!
        }
    }
    
    fileprivate func validateResponseSuccess(_ response: DataResponse<Any>) -> Bool {
        print("Request: \(response.request!)")
        let success = response.result.isSuccess && (self.getStatusCodeFrom(response) == 200)
        print(success ? "SUCCESS" : "FAILURE")
        return success
    }
    
    //API Calls
        
    func signIn(
        _ email: String,
        password: String,
        handler: @escaping (_ success: Bool, _ response: AnyObject?) -> Void
        )
    {
        let parameters: [String: String] = [
            "email": email as String,
            "password": password as String
        ]
        
        self.alamoFireManager.request(baseUrl+signInPath, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
                
                let success = self.validateResponseSuccess(response)
                
                if (success)
                {
                    if let data = response.result.value as? [String : AnyObject] {
                        CurrentUser.sharedInstance.deserialize(data)
                    }
                    
                    handler(true, CurrentUser.sharedInstance)
                }
                else
                {
                    if let value = response.result.value, let error = CoasError(object: value as AnyObject)
                    {
                        handler(false, error)
                    }
                    else if let errorCode = response.response?.statusCode, errorCode == ErrorCode.noInternet.rawValue
                    {
                        let error = CoasError(errorCode: ErrorCode.noInternet)
                        handler(false, error)
                        
                    } else {
                        let error = CoasError()
                        error.detail = "Sign in server error"
                        handler(false, error)
                    }
                }
                
        }
    }
    
 
    func signUp(
        _ email: String,
        firstname: String,
        lastname: String,
        phone: String,
        password: String,
        handler: @escaping (_ success: Bool, _ response: AnyObject?) -> Void
        )
    {
        let parameters: [String: String] = [
            "first_name": firstname as String,
            "last_name": lastname as String,
            "email": email as String,
            "phone": phone as String,
            "password": password as String
        ]
        
        self.alamoFireManager.request(baseUrl+signUpPath, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                
                let success = self.validateResponseSuccess(response)
                
                if (success)
                {
                    if let data = response.result.value as? [String : AnyObject] {
                        CurrentUser.sharedInstance.deserialize(data)
                    }
                    
                    handler(true, CurrentUser.sharedInstance)
                }
                else
                {
                    if let value = response.result.value, let error = CoasError(object: value as AnyObject)
                    {
                        handler(false, error)
                    } else {
                        let error = CoasError()
                        error.detail = "Sign up server error"
                        handler(false, error)
                    }
                }
                
        }
    }
    
    func getHistoryRoomBookingDetails(
        _ userId: String,
        handler: @escaping (_ roomModelList :[RoomModel]?,_ error: CoasError?) -> Void
        )
    {
        let parameters: [String: String] = [
            "user_id": userId as String
        ]
        
        self.alamoFireManager.request(baseUrl+getHistoryBRoomsPath, method: .post, parameters: parameters).responseJSON { response in
            
            let success = self.validateResponseSuccess(response)
            
            if (success)
            {
                let responseText = response.result.value! as! [AnyObject]
                var arrItineraryLsit = [RoomModel]()
                for item in responseText
                {
                    let objItinerary = RoomModel(object: item as AnyObject)
                    arrItineraryLsit.append(objItinerary)
                }
                handler(arrItineraryLsit,nil)
            }
            else
            {
                if let value = response.result.value, let error = CoasError(object: value as AnyObject)
                {
                    handler(nil,error)
                }
                else if let errorCode = response.response?.statusCode, errorCode == ErrorCode.noInternet.rawValue
                {
                    let error = CoasError(errorCode: ErrorCode.noInternet)
                    handler(nil,error)
                    
                } else {
                    let error = CoasError()
                    error.detail = "History Room Booking Details server error"
                    handler(nil,error)
                }
            }
            
        }
    }
    
    
    func getAllRoomDetails(
        _ userId: String,
        filter : String,
        handler: @escaping (_ allRoomsList :[AllRoomsModel]?,_ error: CoasError?) -> Void
        )
    {
        let parameters: [String: String] = [
            "user_id": userId as String,
            "filters": filter as String
        ]
        
        self.alamoFireManager.request(baseUrl+getRoomsPath, method: .post, parameters: parameters).responseJSON { response in
            
            let success = self.validateResponseSuccess(response)
            
            if (success)
            {
                let responseText = response.result.value! as! [AnyObject]
                var arrItineraryLsit = [AllRoomsModel]()
                for item in responseText
                {
                    let objItinerary = AllRoomsModel(object: item as AnyObject)
                    arrItineraryLsit.append(objItinerary)
                }
                handler(arrItineraryLsit,nil)
            }
            else
            {
                if let value = response.result.value, let error = CoasError(object: value as AnyObject)
                {
                    handler(nil,error)
                }
                else if let errorCode = response.response?.statusCode, errorCode == ErrorCode.noInternet.rawValue
                {
                    let error = CoasError(errorCode: ErrorCode.noInternet)
                    handler(nil,error)
                    
                } else {
                    let error = CoasError()
                    error.detail = "History Room Booking Details server error"
                    handler(nil,error)
                }
            }
            
        }
    }
  
    
    func getRoomAvailble(
        _ userId: String,
        room_Id : String,
        checkin : String,
        checkout : String,
        handler: @escaping (_ strStatus: String?, _ strCode: String?,_ error: CoasError?) -> Void
        )
    {
        let URLString = baseUrl+checkRoomAvailble
        
        let parameters: [String: String] = [
            "user_id": userId as String,
            "room_id": room_Id as String,
            "checkin": checkin as String,
            "checkout": checkout as String
        ]
        
          self.alamoFireManager.request(URLString, method: .post, parameters: parameters).responseJSON { response in
                
                let success = self.validateResponseSuccess(response)
                
                if (success)
                {
                    let object = response.result.value as! NSDictionary
                    let json = JSON(object)
                    let strState = json["response"].stringValue
                    handler(strState,json["response_code"].stringValue, nil)
                }
                else
                {
                    if let value = response.result.value, let error = CoasError(object: value as AnyObject)
                    {
                        handler(nil,"", error)
                    }
                    else if let errorCode = response.response?.statusCode, errorCode == ErrorCode.noInternet.rawValue {
                        
                        let error = CoasError(errorCode: ErrorCode.noInternet)
                        handler(nil,"", error)
                        
                    }else {
                        let error = CoasError()
                        error.detail = "Get Error in CheckRoom Availble API"
                        handler(nil,"", error)
                    }
                }
                
        }
        
    }
    
    
    func BookRoom(
        _ userId: String,
        room_Id : String,
        checkin : String,
        checkout : String,
        amount: String,
        em_phone : String,
        em_name : String,
        book_type : String,
        adults: String,
        children : String,
        infants : String,
        guests : [AnyObject],
        handler: @escaping (_ strStatus: String?, _ strCode: String?,_ error: CoasError?) -> Void
        )
    {
        let URLString = baseUrl+bookRoomPath
        
        let parameters: [String: AnyObject] = [
            "user_id": userId as AnyObject,
            "room_id": room_Id as AnyObject,
            "checkin": checkin as AnyObject,
            "checkout": checkout as AnyObject,
            "amount": amount as AnyObject,
            "em_phone": em_phone as AnyObject,
            "em_name": em_name as AnyObject,
            "book_type": book_type as AnyObject,
            "adults": adults as AnyObject,
            "children": children as AnyObject,
            "infants": infants as AnyObject,
            "guests": guests as AnyObject,
        ]
        
        self.alamoFireManager.request(URLString, method: .post, parameters: parameters).responseJSON { response in
            
            let success = self.validateResponseSuccess(response)
            
            if (success)
            {
                let object = response.result.value as! NSDictionary
                let json = JSON(object)
                let strState = json["response"].stringValue
                handler(strState,json["response_code"].stringValue, nil)
            }
            else
            {
                if let value = response.result.value, let error = CoasError(object: value as AnyObject)
                {
                    handler(nil,"", error)
                }
                else if let errorCode = response.response?.statusCode, errorCode == ErrorCode.noInternet.rawValue {
                    
                    let error = CoasError(errorCode: ErrorCode.noInternet)
                    handler(nil,"", error)
                    
                }else {
                    let error = CoasError()
                    error.detail = "Get Error in Booking API"
                    handler(nil,"", error)
                }
            }
            
        }
        
    }
    
    
    func getAmenitiesDetails(
        handler: @escaping (_ amenitiesList :[AmenitiesModel]?,_ error: CoasError?) -> Void
        )
    {
    
        self.alamoFireManager.request(baseUrl+getAmenitiesPath, method: .post, parameters: nil).responseJSON { response in
            
            let success = self.validateResponseSuccess(response)
            
            if (success)
            {
                let responseText = response.result.value! as! [AnyObject]
                var arrItineraryLsit = [AmenitiesModel]()
                for item in responseText
                {
                    let objItinerary = AmenitiesModel(json: item as AnyObject)
                    arrItineraryLsit.append(objItinerary)
                }
                handler(arrItineraryLsit,nil)
            }
            else
            {
                if let value = response.result.value, let error = CoasError(object: value as AnyObject)
                {
                    handler(nil,error)
                }
                else if let errorCode = response.response?.statusCode, errorCode == ErrorCode.noInternet.rawValue
                {
                    let error = CoasError(errorCode: ErrorCode.noInternet)
                    handler(nil,error)
                    
                } else {
                    let error = CoasError()
                    error.detail = "History Room Booking Details server error"
                    handler(nil,error)
                }
            }
            
        }
    }
    
}

