//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class getPosts : NSObject, NSCoding, Mappable{

	var message : String?
	var posts : Post?
	var status : String?


	class func newInstance(map: Map) -> Mappable?{
		return getPosts()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		message <- map["message"]
		posts <- map["posts"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         message = aDecoder.decodeObject(forKey: "message") as? String
         posts = aDecoder.decodeObject(forKey: "posts") as? Post
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
		if posts != nil{
			aCoder.encode(posts, forKey: "posts")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
