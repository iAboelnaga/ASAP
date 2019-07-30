//
//	Data.swift
//
//	Create by Aboelnaga on 6/7/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class RDoctorData : NSObject, NSCoding, Mappable{

	var certificate : String?
	var clinicAddress : AnyObject?
	var hospitalAddress : AnyObject?
	var id : Int?
	var isTrusted : Int?
	var rate : Int?
	var section : RSection?
	var user : RUser?


	class func newInstance(map: Map) -> Mappable?{
		return RDoctorData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		certificate <- map["certificate"]
		clinicAddress <- map["clinic_address"]
		hospitalAddress <- map["hospital_address"]
		id <- map["id"]
		isTrusted <- map["is_trusted"]
		rate <- map["rate"]
		section <- map["section"]
		user <- map["user"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         certificate = aDecoder.decodeObject(forKey: "certificate") as? String
         clinicAddress = aDecoder.decodeObject(forKey: "clinic_address") as? AnyObject
         hospitalAddress = aDecoder.decodeObject(forKey: "hospital_address") as? AnyObject
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isTrusted = aDecoder.decodeObject(forKey: "is_trusted") as? Int
         rate = aDecoder.decodeObject(forKey: "rate") as? Int
         section = aDecoder.decodeObject(forKey: "section") as? RSection
         user = aDecoder.decodeObject(forKey: "user") as? RUser

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if certificate != nil{
			aCoder.encode(certificate, forKey: "certificate")
		}
		if clinicAddress != nil{
			aCoder.encode(clinicAddress, forKey: "clinic_address")
		}
		if hospitalAddress != nil{
			aCoder.encode(hospitalAddress, forKey: "hospital_address")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if isTrusted != nil{
			aCoder.encode(isTrusted, forKey: "is_trusted")
		}
		if rate != nil{
			aCoder.encode(rate, forKey: "rate")
		}
		if section != nil{
			aCoder.encode(section, forKey: "section")
		}
		if user != nil{
			aCoder.encode(user, forKey: "user")
		}

	}

}
