//
//  UserProfileVC.swift
//  medic
//
//  Created by Aboelnaga on 5/8/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {
    
    var profile : UserProfile?
    var post : UserPosts?
    //var t : String?
    let def = UserDefaults.standard
    //let token:String = def.object(forKey: "api_token")! as! String
    let t:String = UserDefaults.standard.object(forKey: "api_token") as! String
    //let def = UserDefaults.standard
    let token:String = " eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY5MjVjODM5YWYzYjJjZTRhMTk2Y2Q0NWU4NmRmYjU5MjIzNzA4OTYyYzBkYTMzMTQyNzUwZjYxMzE5MzE4NTQ0OTg1NTZjNzc2NWIyMGRmIn0.eyJhdWQiOiI1MiIsImp0aSI6ImY5MjVjODM5YWYzYjJjZTRhMTk2Y2Q0NWU4NmRmYjU5MjIzNzA4OTYyYzBkYTMzMTQyNzUwZjYxMzE5MzE4NTQ0OTg1NTZjNzc2NWIyMGRmIiwiaWF0IjoxNTYyMzUzNjQ3LCJuYmYiOjE1NjIzNTM2NDcsImV4cCI6MTU5Mzk3NjA0Nywic3ViIjoiNDIiLCJzY29wZXMiOltdfQ.NW3eCvPVX5_uL9Mk72j-Y73_wZaLdninN_BlbCRZNnlNM0Ejx5JREU2z_aUmkbk5krHEru9Jp4qnrUuVKE7jMO6EhWSGKKs2iwjgFZ4RUc2J5-YlTFUwM5iq69Ksh2iHOC26KuGzzSCtk8THZ52lIRo6WP2TaG6IZPxPK8E-00x2NTr4rW5r89kyZY3VYQZlcuzOmVtOalVyRT7pnyJhQ5f4v_qo_hFLxLkPAkopu_tAfJP63oBl2iyvknCL_hQpv0oguF7pP_CB-lZ60rX1SlWr5D88Ep68ZLr5mjqkyK-pviBWp4l6SEmYchXrJf6MKcHh3-fATV9lpDAk2UJ0g1J9iCf3TW68ZJWDy-WJvLG-c6AEl099y98NLJRd_rvUUQ18nJQ_K7rG4I9qRlVYRjIw2xmPOAlGVKSD2QQK67Z5wweEdlK3DsMr3McWzGMvFt3ZYj14PtjLURiP889ZIg8vRu0rZsG87i8FCG509eBDxg4Cfb34ODyxSK7vHR8eE9Q4Dd9mPNdrp8z81n1UlmVQ_uOpjqNCWCEbV-e__i9ANqgd4Tfh3BfaSKiRGd-_DPFdlNhVwlZH_RKeUX6M-nvMUmlKem7nIjS8xIWvvwt3TOXG9k7tJ_QWOOpcX_S2hs1PqqeWDunsJ7Q8N2xbS3zwTMX8Wqe9aY4hjDRlcOA"
        //UserDefaults.standard.object(forKey: "api_token") as! String
    
    @IBOutlet weak var userPP: UIImageView!
    @IBOutlet weak var postsTV: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var loc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefresh()
        handleRefreshPosts()
        userPP.layer.cornerRadius = 15
        userPP.clipsToBounds = true
        userPP.layer.shadowRadius = 2.0
        userPP.layer.shadowColor = UIColor.gray.cgColor
    }
    private func handleRefresh(){
        let access_token = "Bearer " + t
        ApiRequests.userProfile(access_token: access_token) { (error:Error?, profile:UserProfile?) in
            if let profile = profile {
                self.profile = profile
                self.setData()
                self.postsTV.reloadData()
            }else{
                /*
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let profile = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                self.navigationController?.pushViewController(profile, animated: true)
                */
            }
        }
    }
    func setData() {
        
        self.name.text = profile?.user?.name
        self.loc.text = profile?.user?.country
        
        let imageString = (profile?.user?.avatar)!
        let imagesUrl = URL(string: imageString)!
        self.userPP?.kf.setImage(with: imagesUrl)
        
    }
    private func handleRefreshPosts(){
        let access_token = "Bearer " + t
        ApiRequests.userPosts(access_token: access_token) { (error:Error?, post:UserPosts?) in
            if let post = post {
                self.post = post
                self.postsTV.reloadData()
            }else{
                /*
                 let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                 let profile = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                 self.navigationController?.pushViewController(profile, animated: true)
                 */
            }
        }
    }
    @IBAction func newPost(_ sender: Any)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "NewPostVC") as! NewPostVC
        self.navigationController?.pushViewController(profile, animated: true)
    }
    @IBAction func setting(_ sender: Any)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "EditVC") as! EditVC
        self.navigationController?.pushViewController(profile, animated: true)
    }
}
extension UserProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return post?.posts?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! CustomTableCell
        
        cell.postLabel.text = post?.posts?.data?[indexPath.section].body
        cell.userName.text = profile?.user?.name
        cell.location.text = profile?.user?.address
        /*
        let imageString = profile?.user?.avatar
        let imagesUrl = URL(string: imageString!)
        cell.userPP?.kf.setImage(with: imagesUrl)
        */
        cell.contentView.layer.cornerRadius = 15.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 17
    }
}
