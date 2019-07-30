//
//  allPosts.swift
//  medic
//
//  Created by EsraaEid on 7/6/19.
//  Copyright © 2019 Malak. All rights reserved.
//

import UIKit

class allPosts: UIViewController {
    
    var post : getPosts?
    
    @IBOutlet weak var sideM: UIButton!
    @IBOutlet weak var postsTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad ()
         handleRefreshPosts()
        
        let revealViewController = self.revealViewController()
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        sideM.addTarget(revealViewController, action:#selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
    }
    
    private func handleRefreshPosts(){
        
        ApiRequests.getPost { ( error:Error?, post:getPosts?)
        in
            if let post = post {
                self.post = post
                self.postsTV.reloadData()
            }else{
               
            }
        }
    }
}
extension allPosts: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return  post?.posts?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPosts") as! postsCells
        
        cell.PostArea.text = post?.posts?.data?[indexPath.section].body
        cell.userName.text = post?.posts?.data?[indexPath.section].user?.name
        cell.userLocation.text = post?.posts?.data?[indexPath.section].user?.country as? String
        let imageString = (post?.posts?.data?[indexPath.section].user?.avatar)!
        let imagesUrl = URL(string: imageString)!
        cell.userImg?.kf.setImage(with: imagesUrl)
        
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
        //cell.layer.backgroundColor = UIColor.clear.cgColor
        
        return cell
}
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
}
