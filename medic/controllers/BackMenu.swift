//
//  BackMenu.swift
//  SideMenu2
//
//  Created by EsraaEid on 5/11/19.
//  Copyright © 2019 Malak. All rights reserved.
//

import Foundation
class BackMenu: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    let def = UserDefaults.standard
    let t:String = UserDefaults.standard.object(forKey: "api_token") as! String
    
    let labs :[String] = ["123" , "Speciality" , "Community" , "Messenger" ," " ,"Logout"]
    let imgs = ["menuCall","menuElsma3a","menuElsma3a","menuElsma3a","nothing","menuElsma3a" ]
    let dots = ["menuDot","menuDot","menuDot","menuDot","nothing","menuDot" ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cellDetails", for: indexPath) as! cellDetails
        cell.labelName.text = labs[indexPath.row]
        cell.ImageNAme.image = UIImage (named: imgs[indexPath.row] as! String ?? "")
        cell.dotImg.image = UIImage (named: dots[indexPath.row] as! String ?? "")
         return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            guard let number = URL(string: "tel://123") else { return }
            UIApplication.shared.open(number)
        case 1:
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
            let navController = UINavigationController(rootViewController: obj)
            navController.setViewControllers([obj], animated:true)
            self.revealViewController().setFront(navController, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
        case 2:
            
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "allPosts") as! allPosts
            let navController = UINavigationController(rootViewController: obj)
            navController.setViewControllers([obj], animated:true)
            self.revealViewController().setFront(navController, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
            
        case 3:
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "AllChats") as! AllChats
            let navController = UINavigationController(rootViewController: obj)
            navController.setViewControllers([obj], animated:true)
            self.revealViewController().setFront(navController, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
        case 5:
            //LOGOUT
            print("LOGOUT")
            let access_token = "Bearer " + t
            ApiRequests.logout(access_token: access_token) { (error:Error?, success:Bool) in
              if success{
                self.show(message: "you are logged Out")
                    
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            let navController = UINavigationController(rootViewController: obj)
            navController.setViewControllers([obj], animated:true)
            self.revealViewController().setFront(navController, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
                }
            }
        default:
            print("Error")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func show(message: String) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 25;
        toastContainer.clipsToBounds  =  true
        
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        toastContainer.addSubview(toastLabel)
        self.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -75)
        self.view.addConstraints([c1, c2, c3])
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
    }

    
    

