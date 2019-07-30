//
//	Post.swift
//
//	Create by Aboelnaga on 13/7/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class NewPost : NSObject, NSCoding, Mappable{

	var body : String?
	var comments : [AnyObject]?
	var createdAt : String?
	var id : Int?
	var tags : String?
	var title : String?
	var updatedAt : String?
	var user : UserPost?
	var userId : Int?
	var vote : Int?
	var votes : [AnyObject]?


	class func newInstance(map: Map) -> Mappable?{
		return NewPost()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		body <- map["body"]
		comments <- map["comments"]
		createdAt <- map["created_at"]
		id <- map["id"]
		tags <- map["tags"]
		title <- map["title"]
		updatedAt <- map["updated_at"]
		user <- map["user"]
		userId <- map["user_id"]
		vote <- map["vote"]
		votes <- map["votes"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         body = aDecoder.decodeObject(forKey: "body") as? String
         comments = aDecoder.decodeObject(forKey: "comments") as? [AnyObject]
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         tags = aDecoder.decodeObject(forKey: "tags") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         user = aDecoder.decodeObject(forKey: "user") as? UserPost
         userId = aDecoder.decodeObject(forKey: "user_id") as? Int
         vote = aDecoder.decodeObject(forKey: "vote") as? Int
         votes = aDecoder.decodeObject(forKey: "votes") as? [AnyObject]

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
		if comments != nil{
			aCoder.encode(comments, forKey: "comments")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if tags != nil{
			aCoder.encode(tags, forKey: "tags")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if user != nil{
			aCoder.encode(user, forKey: "user")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "user_id")
		}
		if vote != nil{
			aCoder.encode(vote, forKey: "vote")
		}
		if votes != nil{
			aCoder.encode(votes, forKey: "votes")
		}

	}

}
