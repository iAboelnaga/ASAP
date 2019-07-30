//
//  DoctorProfileViewController.swift
//  medic
//
//  Created by EsraaEid on 7/9/19.
//  Copyright © 2019 Malak. All rights reserved.
//

import UIKit

class DoctorProfileVC : UIViewController {
    
    @IBOutlet weak var docPP: UIImageView!
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var docLocation: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var add: UILabel!
    @IBOutlet weak var chat: UIButton!
    
    var doc : DoctorProfile?
    var id : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefresh()
        docPP.layer.cornerRadius = 15
        docPP.clipsToBounds = true
        docPP.layer.shadowRadius = 2.0
        docPP.layer.shadowColor = UIColor.gray.cgColor
        
        customizeButtonG1(buttonName: chat)
    }
    func customizeButtonG1(buttonName:UIButton) {
        // change UIbutton propertie
        let c1GreenColor = (UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0))
        let c2GreenColor = (UIColor(red: 0, green: 0, blue: 0, alpha: 0.08))
        //buttonName.backgroundColor = UIColor.yellow
        //buttonName.layer.cornerRadius = 7
        buttonName.layer.borderWidth = 3
        buttonName.layer.borderColor = c1GreenColor.cgColor
        
        buttonName.layer.shadowColor = c2GreenColor.cgColor
        buttonName.layer.shadowOpacity = 1
        buttonName.layer.shadowRadius = 40
        buttonName.layer.shadowOffset = CGSize(width: 0, height: 0)
        /*
         buttonName.setImage(UIImage(named:"3d-glass-refresh-32X32.png"), for: .normal)
         buttonName.imageEdgeInsets = UIEdgeInsets(top: 6,left: 100,bottom: 6,right: 14)
         buttonName.titleEdgeInsets = UIEdgeInsets(top: 0,left: -30,bottom: 0,right: 34)
         */
    }
    private func handleRefresh(){
        
        let id = self.id
        ApiRequests.docProfile(id: id!) { (error:Error?, doc:DoctorProfile?) in
            if let doc = doc {
                self.doc = doc
                self.setData()
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
        
        self.docName.text = doc?.user?.name
        self.docLocation.text = doc?.user?.country
        self.label3.text = doc?.user?.phone
        self.email.text = doc?.user?.email
        self.add.text = doc?.user?.address
        
        let imageString = (doc?.user?.avatar)!
        let imagesUrl = URL(string: imageString)!
        self.docPP?.kf.setImage(with: imagesUrl)
        
    }
    @IBAction func reserve(_ sender: Any)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "ReserveVC") as! ReserveVC
        self.navigationController?.pushViewController(profile, animated: true)
    }
    @IBAction func chat(_ sender: Any)
    {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        self.navigationController?.pushViewController(profile, animated: true)
 
    }
}
