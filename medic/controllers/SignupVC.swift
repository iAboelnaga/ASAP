//
//  SignupVC.swift
//  medic
//
//  Created by Aboelnaga on 3/22/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var signup: UIButton!
    
    var token: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.setPadding()
        usernameTF.setBottomBorder()
        
        emailTF.setPadding()
        emailTF.setBottomBorder()
        
        passwordTF.setPadding()
        passwordTF.setBottomBorder()
        
        customizeButtonG1(buttonName: signup)
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
    @IBAction func signup(_ sender: Any)
    {
        guard let userName = usernameTF.text, !userName.isEmpty else { return }
        guard let email = emailTF.text, !email.isEmpty else { return }
        guard let name = usernameTF.text, !name.isEmpty else { return }
        guard let password = passwordTF.text, !password.isEmpty else { return }
        let gender = "female"
        
        ApiRequests.signup(userName: userName, name: name, email: email, password: password, gender: gender) { (error:Error?, success:Bool) in
            if success {
                
                self.show(message: "you are signed up")
                
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let profile = storyBoard.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
                self.navigationController?.pushViewController(profile, animated: true)
            }
        }
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
extension UITextField {
    
    func setPadding2() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setBottomBorder() {
        self.layer.shadowColor = UIColor.init(red: 45.0/255.0, green: 156.0/255.0, blue: 219.0/255.0, alpha: 1.0).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
