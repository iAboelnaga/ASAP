//
//	RootClass.swift
//
//	Create by Aboelnaga on 12/7/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DoctorProfile : NSObject, NSCoding, Mappable{

	var message : String?
	var status : String?
	var user : DoctorProfileData?


	class func newInstance(map: Map) -> Mappable?{
		return DoctorProfile()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		message <- map["message"]
		status <- map["status"]
		user <- map["user"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         message = aDecoder.decodeObject(forKey: "message") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         user = aDecoder.decodeObject(forKey: "user") as? DoctorProfileData

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if user != nil{
			aCoder.encode(user, forKey: "user")
		}

	}

}
