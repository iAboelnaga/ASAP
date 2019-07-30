//
//	RootClass.swift
//
//	Create by Aboelnaga on 6/7/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Recommended : NSObject, NSCoding, Mappable{

	var doctors : RecommendedDoctor?
	var message : String?
	var status : String?


	class func newInstance(map: Map) -> Mappable?{
		return Recommended()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		doctors <- map["doctors"]
		message <- map["message"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         doctors = aDecoder.decodeObject(forKey: "doctors") as? RecommendedDoctor
         message = aDecoder.decodeObject(forKey: "message") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if doctors != nil{
			aCoder.encode(doctors, forKey: "doctors")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
