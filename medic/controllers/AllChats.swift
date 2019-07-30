//
//  AllChats.swift
//  medic
//
//  Created by EsraaEid on 7/7/19.
//  Copyright © 2019 Malak. All rights reserved.
//

import UIKit

class AllChats: UIViewController {

    @IBOutlet weak var sideM: UIButton!
    @IBOutlet weak var chatTV: UITableView!
     let token:String = " eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk2ZTViNzdlMWZiM2RjNGM3ODQzZDQ0NTVjYWY1N2E0NjQ0NzdiNzBmMjBkNmY5Njk1ZmUyNjNmNjY1NTM4YTE0YjFmNDAyNmYzMWMzZDNlIn0.eyJhdWQiOiI1MiIsImp0aSI6Ijk2ZTViNzdlMWZiM2RjNGM3ODQzZDQ0NTVjYWY1N2E0NjQ0NzdiNzBmMjBkNmY5Njk1ZmUyNjNmNjY1NTM4YTE0YjFmNDAyNmYzMWMzZDNlIiwiaWF0IjoxNTYyNDMxNDYwLCJuYmYiOjE1NjI0MzE0NjAsImV4cCI6MTU5NDA1Mzg2MCwic3ViIjoiNDIiLCJzY29wZXMiOltdfQ.ZnY5zpvEskxQ4j3_4Bfin8bjdysCldKWgI5IIXjI97w8U5p7W32MwI8tMz-v45VGeYoL-nHBWPBjLWcqyzZkmzn4R-7L7h-TQNjpitJ05HYWG2FSS7ymOyXUR8gmd6Z-W7Tqx2kBITw1vnMuuQGIGl7vB8TEb08eMDlsDqC7Ss-dj2f9Rvv5dKzwbAxQdGd1_paQTKDV-i8Fe6jqYr8pTiJSuZxIm93e40jk5c_LyX9TFzvYnlSYrPjl6Gxgp1B-6RJNdErCTRQnCXEMBQLHL9vli9T2cT-aQ7ljRrtQ4-kdTH50SWVBRKABz1F84Wk66B_sNmmz54HfW5jok9QWcmZtR8r5Wf30jAzw0R90bXqjFTIL6it0uAlcJ6Y1ALTXMPfIzYjt1jVbDWKkHZFfIPPpHYVUqyA571TjBe1lxzR9ZKhUuEqNiayD9SkVN8l4CMzE97SJmA7IaqgNuhzhfdQp0ThBypL5cAHs9o2o4jlrCIxZz7zB_B2PTO6LC6uwYcd_vaeTWjomND-O5p1-Ys0GJVfCZGJepBLF712yiVjOJ741zd3ITaHy4OA4O-6MZRcbvNbvUUZoCkfVMBdtVCVzXIgIyPEOzsolChoLldM2j7Os5wTxd3AtuOoMAaM5ukJieyLv7Ua_AgTwdupN19zPf8jcxhEgMP5ClaQuMgw"
    var  chat : getChats?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefreshChats()
        
        let revealViewController = self.revealViewController()
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        sideM.addTarget(revealViewController, action:#selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
    }
    
    
  /*  func setData() {
        
        let imageString = (profile?.user?.avatar)!
        let imagesUrl = URL(string: imageString)!
        self.userPP?.kf.setImage(with: imagesUrl)
        
    }*/
    private func handleRefreshChats(){
        let access_token = "Bearer" + token
        ApiRequests.getAllChat(access_token: access_token) { (error:Error?, chat:getChats?) in
            if let chat = chat {
                self.chat = chat
                self.chatTV.reloadData()
            }else{
                /*
                 let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                 let profile = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                 self.navigationController?.pushViewController(profile, animated: true)
                 */
            }
        }

}
}
extension AllChats: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  chat?.chats?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellChats") as! ChatsCells
        
        cell.userNameC.text = chat?.chats?[0].recipients?[indexPath.row].user?.name
        cell.lastMsg.text = chat?.chats?[0].messages?[indexPath.row].body
        
        let imageString = (chat?.chats?[0].recipients?[indexPath.row].user?.avatar)!
        let imagesUrl = URL(string: imageString)!
        cell.userPhoto?.kf.setImage(with: imagesUrl)
        return cell
         }
    }

