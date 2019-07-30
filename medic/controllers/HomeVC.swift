//
//  ViewController.swift
//  medic
//
//  Created by Aboelnaga on 3/7/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var loginOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginOutlet.layer.borderColor = UIColor.white.cgColor
        loginOutlet.layer.borderWidth = 1.0
        
    }
    @IBAction func loginButton(_ sender: Any)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(profile, animated: true)
    }
    @IBAction func signupButton(_ sender: Any)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(profile, animated: true)
    }
}
