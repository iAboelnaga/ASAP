//
//  popUpViewController.swift
//  medic
//
//  Created by EsraaEid on 7/15/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import UIKit

class popUpViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        
       self.view.backgroundColor = UIColor.clear.withAlphaComponent(0.8)
        // Do any additional setup after loading the view.
    }
   
    static func create()-> UIViewController{
        let storyboard =  UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:"PopUpViewController") as! popUpViewController
        return storyboard
    }
    
    @IBAction func OkButton(_ sender: Any)
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        self.navigationController!.pushViewController(newViewController, animated: true)
    }
}
