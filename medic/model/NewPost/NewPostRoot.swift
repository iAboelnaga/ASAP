//
//	RootClass.swift
//
//	Create by Aboelnaga on 13/7/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class NewPostRoot : NSObject, NSCoding, Mappable{

	var message : String?
	var post : NewPost?
	var status : String?


	class func newInstance(map: Map) -> Mappable?{
		return NewPostRoot()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		message <- map["message"]
		post <- map["post"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         message = aDecoder.decodeObject(forKey: "message") as? String
         post = aDecoder.decodeObject(forKey: "post") as? NewPost
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
		if post != nil{
			aCoder.encode(post, forKey: "post")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
