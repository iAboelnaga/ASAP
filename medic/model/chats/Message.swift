//
//	Message.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Message : NSObject, NSCoding, Mappable{

	var body : String?
	var chatId : Int?
	var createdAt : String?
	var id : Int?
	var updatedAt : String?
	var userId : Int?


	class func newInstance(map: Map) -> Mappable?{
		return Message()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		body <- map["body"]
		chatId <- map["chat_id"]
		createdAt <- map["created_at"]
		id <- map["id"]
		updatedAt <- map["updated_at"]
		userId <- map["user_id"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         body = aDecoder.decodeObject(forKey: "body") as? String
         chatId = aDecoder.decodeObject(forKey: "chat_id") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if body != nil{
			aCoder.encode(body, forKey: "body")
		}
		if chatId != nil{
			aCoder.encode(chatId, forKey: "chat_id")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "user_id")
		}

	}

}