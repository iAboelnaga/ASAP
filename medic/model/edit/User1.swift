//
//	User.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class User1 : NSObject, NSCoding, Mappable{

	var address : String?
	var avatar : String?
	var country : String?
	var createdAt : String?
	var email : String?
	var gender : String?
	var id : Int?
	var name : String?
	var phone : String?
	var state : String?
	var updatedAt : String?
	var username : String?


	class func newInstance(map: Map) -> Mappable?{
		return User1()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		address <- map["address"]
		avatar <- map["avatar"]
		country <- map["country"]
		createdAt <- map["created_at"]
		email <- map["email"]
		gender <- map["gender"]
		id <- map["id"]
		name <- map["name"]
		phone <- map["phone"]
		state <- map["state"]
		updatedAt <- map["updated_at"]
		username <- map["username"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address = aDecoder.decodeObject(forKey: "address") as? String
         avatar = aDecoder.decodeObject(forKey: "avatar") as? String
         country = aDecoder.decodeObject(forKey: "country") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         gender = aDecoder.decodeObject(forKey: "gender") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         phone = aDecoder.decodeObject(forKey: "phone") as? String
         state = aDecoder.decodeObject(forKey: "state") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         username = aDecoder.decodeObject(forKey: "username") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if address != nil{
			aCoder.encode(address, forKey: "address")
		}
		if avatar != nil{
			aCoder.encode(avatar, forKey: "avatar")
		}
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if phone != nil{
			aCoder.encode(phone, forKey: "phone")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if username != nil{
			aCoder.encode(username, forKey: "username")
		}

	}

}
