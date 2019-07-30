//
//  ApiRequests.swift
//  medic
//
//  Created by Aboelnaga on 4/19/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper

class ApiRequests: NSObject {
    
    class func signup(userName: String, name: String, email: String, password: String, gender: String, completion:@escaping(_ _error:Error?, _ success:Bool)->Void){
        let url = "http://asap-api.herokuapp.com/api/user"
        let parameters = [
            "username" : userName,
            "password" : password,
            "name" : name,
            "email" : email,
            "gender" : gender,
            ]
        let headers = ["x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0"]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            //.validate(statusCode:200..<300)
            .responseJSON{ response in
                switch response.result
                {
                case.failure(let error):
                    completion(error, false)
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    if let access_token = json["user"]["token"].string{
                        print("access_token: \(access_token)")
                    let def = UserDefaults.standard
                    def.setValue(access_token, forKey: "api_token")
                    def.synchronize()
                    completion(nil,true)
                }
            }
    }
}
    class func login(email: String, password: String, completion:@escaping(_ _error:Error?, _ success:Bool)->Void){
        let url = "https://asap-api.herokuapp.com/api/user/login?"
        let parameters = [
            "username" : email,
            "password" : password
        ]
        let headers = [
            "x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0"]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result
                {
                case.failure(let error):
                    completion(error, false)
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    if let access_token = json["user"]["token"].string{
                    print(access_token)
                    let def = UserDefaults.standard
                    def.setValue(access_token, forKey: "api_token")
                    def.synchronize()
                    completion(nil,true)
                    }
                }
        }
    }
    class func section(completion:@escaping(_ _error:Error?, _ countries:Sections?)->Void){
        let url = "https://asap-api.herokuapp.com/api/section"
        
        let headers = ["x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0"]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<Sections>) in
                //print(response.result.value?.data?.countries?.toJSONString())
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    completion(nil, response.result.value)
                }
            })
    }
    class func logout(access_token: String, completion:@escaping(_ _error:Error?, _ success:Bool)->Void){
        let url = "https://asap-api.herokuapp.com/api/user/logout"
        
        let headers = [
            "x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0",
            "Authorization" : access_token,
            ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result
                {
                case.failure(let error):
                    completion(error, false)
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    if let access_token = json["message"].string{
                        print(access_token)
                        let def = UserDefaults.standard
                        def.setValue(nil, forKey: "api_token")
                        def.synchronize()
                        completion(nil,true)
                    }
                }
        }
    }
    class func recommend(completion:@escaping(_ _error:Error?, _ countries:Recommended?)->Void){
        let url = "https://asap-api.herokuapp.com/api/doctor/recommended"
        
        let headers = ["x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0"]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<Recommended>) in
                //print(response.result.value?.data?.countries?.toJSONString())
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    completion(nil, response.result.value)
                }
            })
    }
    class func userProfile(access_token:String, completion:@escaping(_ _error:Error?, _ profile:UserProfile?)->Void){
        let url = "https://asap-api.herokuapp.com/api/user"
        
        let headers = ["x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0",
                       "Authorization" : access_token,
                       ]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode:200..<600).responseObject(completionHandler: { (response: DataResponse<UserProfile>) in
                
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    completion(nil, response.result.value)
                }
            })
    }
    class func newPost(access_token:String, title:String, body:String, completion:@escaping(_ _error:Error?, _ profile:NewPostRoot?)->Void){
        let url = "https://asap-api.herokuapp.com/api/post"
        
        let headers = ["x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0",
                       "Authorization" : access_token,
                       ]
        let parameters = [
            "title" : title,
            "body" : body,
            "tags" : "['tag1', 'tag2']"
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode:200..<600).responseObject(completionHandler: { (response: DataResponse<NewPostRoot>) in
                
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    completion(nil, response.result.value)
                }
            })
    }
    class func docProfile(id:Int, completion:@escaping(_ _error:Error?, _ profile:DoctorProfile?)->Void){
        
        let url = "https://asap-api.herokuapp.com/api/user/get/"
        let fullUrl = "\(url)\(id)"
        
        let headers = ["x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0"]
        
        Alamofire.request(fullUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode:200..<600).responseObject(completionHandler: { (response: DataResponse<DoctorProfile>) in
                
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    completion(nil, response.result.value)
                }
            })
    }
    class func userPosts(access_token:String, completion:@escaping(_ _error:Error?, _ post:UserPosts?)->Void){
        let url = "http://asap-api.herokuapp.com/api/post/profile"
        
        let headers = ["x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0",
                       "Authorization" : access_token,
                       ]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode:200..<600).responseObject(completionHandler: { (response: DataResponse<UserPosts>) in
                
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    completion(nil, response.result.value)
                }
            })
    }
    
    class func section(id:Int, completion:@escaping(_ _error:Error?, _ success:DocSections?)->Void){
        let url = "https://asap-api.herokuapp.com/api/section/doctors?"
        let parameters = ["section_id" : id]
        
        let headers = ["x-api-key" : "AIOVC13hF7XZFcFPgEFFwGC9natRfjF0"]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<DocSections>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    completion(nil, response.result.value)
                }
            })
    }
    class func editData(access_token:String, fullName:String, address:String, state:String, country:String, phone:String, avatar:UIImage, completion:@escaping(_ _error:Error?, _ success:Bool)->Void){
        let url = "https://asap-api.herokuapp.com/api/user/update"
        let parameters = [
            "name" : fullName,
            "address" : address,
            "state" : state,
            "country" : country,
            "phone" : phone
        ]
        let headers = [
            "x-api-key" : "ZzLeaQ8ULn64Pk989xqDojYddNiNTryenZ3FNGQ",
            "Authorization" : access_token
        ]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
            if let imageData = avatar.jpegData(compressionQuality: 0.5) {
                multipartFormData.append(imageData, withName: "avatar", fileName: "avatar.png", mimeType: "avatar/jpeg")
            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url, method: .post, headers:headers)
        {(result: SessionManager.MultipartFormDataEncodingResult) in
            switch result {
                
            case.failure(let error):
                completion(error, false)
                print(error)
            case .success(let upload, _, _):
                
                upload.responseJSON (completionHandler: { (response: DataResponse<Any>) in
                    switch response.result
                    {
                    case.failure(let error):
                        completion(error, false)
                        print(error)
                    case.success(let value):
                        let json = JSON(value)
                        if let msg = json["message"].string{
                            print(msg)
                            completion(nil,true)
                        }
                    }
                })
            }
        }
    }
    class func getPost(completion:@escaping(_ _error:Error?, _ post:getPosts?)->Void){
        let url = "https://asap-api.herokuapp.com/api/post"
        
        let headers = ["x-api-key" : "ZzLeaQ8ULn64Pk989xqDojYddNiNTryenZ3FNGQJ",
                       
                       ]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode:200..<600).responseObject(completionHandler: { (response: DataResponse<getPosts>) in
                
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    completion(nil, response.result.value)
                }
            })
    }
    class func getAllChat(access_token:String, completion:@escaping(_ _error:Error?, _ chat:getChats?)->Void){
        let url = "https://asap-api.herokuapp.com/api/chat"
        
        let headers = ["x-api-key" : "ZzLeaQ8ULn64Pk989xqDojYddNiNTryenZ3FNGQJ",
                       "Authorization" : access_token,
                       ]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode:200..<600).responseObject(completionHandler: { (response: DataResponse<getChats>) in
                
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    completion(nil, response.result.value)
                }
            })
    }

}
