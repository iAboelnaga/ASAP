//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class getChats : NSObject, NSCoding, Mappable{

	var chats : [Chat]?
	var message : String?
	var status : String?


	class func newInstance(map: Map) -> Mappable?{
		return getChats()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		chats <- map["chats"]
		message <- map["message"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         chats = aDecoder.decodeObject(forKey: "chats") as? [Chat]
         message = aDecoder.decodeObject(forKey: "message") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if chats != nil{
			aCoder.encode(chats, forKey: "chats")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
