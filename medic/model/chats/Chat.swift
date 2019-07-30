//
//	Chat.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Chat : NSObject, NSCoding, Mappable{

	var id : Int?
	var messages : [Message]?
	var recipients : [Recipient]?
	var title : String?


	class func newInstance(map: Map) -> Mappable?{
		return Chat()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["id"]
		messages <- map["messages"]
		recipients <- map["recipients"]
		title <- map["title"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "id") as? Int
         messages = aDecoder.decodeObject(forKey: "messages") as? [Message]
         recipients = aDecoder.decodeObject(forKey: "recipients") as? [Recipient]
         title = aDecoder.decodeObject(forKey: "title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if messages != nil{
			aCoder.encode(messages, forKey: "messages")
		}
		if recipients != nil{
			aCoder.encode(recipients, forKey: "recipients")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}

	}

}
