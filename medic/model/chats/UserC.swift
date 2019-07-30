//
//	User.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class UserC : NSObject, NSCoding, Mappable{

	var avatar : String?
	var id : Int?
	var name : String?
	var username : String?


	class func newInstance(map: Map) -> Mappable?{
		return UserC()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		avatar <- map["avatar"]
		id <- map["id"]
		name <- map["name"]
		username <- map["username"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         avatar = aDecoder.decodeObject(forKey: "avatar") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         username = aDecoder.decodeObject(forKey: "username") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if avatar != nil{
			aCoder.encode(avatar, forKey: "avatar")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if username != nil{
			aCoder.encode(username, forKey: "username")
		}

	}

}
