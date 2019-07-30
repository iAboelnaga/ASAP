//
//	Recipient.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Recipient : NSObject, NSCoding, Mappable{

	var user : UserC?


	class func newInstance(map: Map) -> Mappable?{
		return Recipient()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		user <- map["user"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         user = aDecoder.decodeObject(forKey: "user") as? UserC

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if user != nil{
			aCoder.encode(user, forKey: "user")
		}

	}

}
