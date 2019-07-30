//
//  NewPostVC.swift
//  medic
//
//  Created by Aboelnaga on 7/13/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import UIKit

class NewPostVC: UIViewController {

    @IBOutlet weak var bodyTF: UITextField!
    
    var post : NewPostRoot?
    let def = UserDefaults.standard
    let t:String = UserDefaults.standard.object(forKey: "api_token") as! String
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func handleRefresh(){
        
        let access_token = "Bearer " + t
        //guard let userName = usernameTF.text, !userName.isEmpty else { return }
        guard let body = bodyTF.text, !body.isEmpty else { return }
        
        ApiRequests.newPost(access_token: access_token, title: "New Post", body: body) { (error:Error?, post:NewPostRoot?) in
            if let post = post {
                self.post = post
                self.bodyTF.text = ""
            }else{
                
            }
        }
    }
    @IBAction func tweet(_ sender: Any)
    {
        handleRefresh()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "allPosts") as! allPosts
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
}
