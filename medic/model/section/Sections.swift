//
//	RootClass.swift
//
//	Create by Aboelnaga on 5/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Sections : NSObject, NSCoding, Mappable{

	var message : String?
	var sections : Section?
	var status : String?


	class func newInstance(map: Map) -> Mappable?{
		return Sections()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		message <- map["message"]
		sections <- map["sections"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         message = aDecoder.decodeObject(forKey: "message") as? String
         sections = aDecoder.decodeObject(forKey: "sections") as? Section
         status = aDecoder.decodeObject(forKey: "status") as? String

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
		if sections != nil{
			aCoder.encode(sections, forKey: "sections")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
