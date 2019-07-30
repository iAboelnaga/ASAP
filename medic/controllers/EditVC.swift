//
//  ViewController.swift
//  settings
//
//  Created by EsraaEid on 6/24/19.
//  Copyright © 2019 Malak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EditVC: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profileImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        address.setPadding()
        address.setButtomBorder()
        name.setPadding()
        name.setButtomBorder()
        state.setPadding()
        state.setButtomBorder()
        country.setPadding()
        country.setButtomBorder()
        phone.setPadding()
        phone.setButtomBorder()

    }
    @IBAction func done(_ sender: Any) {
        
        guard let name = name.text , !name.isEmpty else {return}
        guard let address = address.text , !address.isEmpty else {return}
        guard let state = state.text , !state.isEmpty else {return}
        guard let country = country.text , !country.isEmpty else {return}
        guard let phone = phone.text , !phone.isEmpty else {return}
        
        let image = profileImg.image
        
        ApiRequests.editData(access_token: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc4ZDJkYWFjMmE4ODIzNDkxNmM0YmYyMDgzZDc0OTEwN2YxYjVmY2IzYTY1ODZkNzI0ZWM2N2Y5N2M0NzViYzkwOTcxYzMwZTgzMDdmNTBkIn0.eyJhdWQiOiI1MiIsImp0aSI6Ijc4ZDJkYWFjMmE4ODIzNDkxNmM0YmYyMDgzZDc0OTEwN2YxYjVmY2IzYTY1ODZkNzI0ZWM2N2Y5N2M0NzViYzkwOTcxYzMwZTgzMDdmNTBkIiwiaWF0IjoxNTYxMzM3MTc1LCJuYmYiOjE1NjEzMzcxNzUsImV4cCI6MTU5Mjk1OTU3NSwic3ViIjoiNDIiLCJzY29wZXMiOltdfQ.mA-RTkv2iuPdAi-F886DVp15L0xAmSmUunsPeMpnV9GEnkJqGj4qf8EVpIkeBx16e0i03Y1jzwpcuCmG0PZxirlHIRFT6w493l1z9g3QORDnY8KDLMiuU-nPPjMMMx3ffzDdWlCgxcsqjbMKFJQG-EIhUyQYFRt1xa7jXIMhNe7O1c0HVC03rW0woBVWSWkaIqSqtn_S9iU0FNJNnXOb-6MVFyq-IizQjzTW-0RDcWhcPvmGQ5IyGjDYaGpRVJTYhpiJ5Djrf311JrVWAFhFGtYGt4PGQayIRGLarOmnAfbvdOwQ5RQ3io-D5fhIKoLGi7hlXwVHdcyPm1xoupLZ5dkp6JwvQhcPRAu64AM0_omLKj3hqE7pKdMbOwnUQSU8w0nrT95AeXkBawrHmB1tdom-PGGknOxB0di0ajz9z7NwJlhI6LxVkDC3PcOnUTsESMxWzBv2QYRFFaHw2wOcav0-AZKfenEZlGtUKP-DfkMiQ4oLteMfTqkbgT2mSamcjoE9-0QMrUoLuJ1a1UISqcGvxpwTfFR2g4H-6JPuZ5yxkwJWbxjGNW2VK2sT30ThgvAp13CnV6r3Zp8SFTMy8-1g2ZhIBvI0foGb7Gxo1AdQcG93CBt8BpJAbHjQyOoDkdGbQADBCHWI5bcRsLa6S4m3JoNG4vUJo8Vq4tp3eS4", fullName: name, address: address, state: state, country: country, phone: phone, avatar: image!) { (error:Error?, success:Bool) in
            if success{
                print("UPDATED HERE")
                //self.show(message: "تم تسجيل الدخول بنجاح")
                /*
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let profile = storyBoard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
                self.navigationController?.pushViewController(profile, animated: true)*/
                
            }else{
                //self.show(message: "حاول مره أخرى")
            }
        }
    }
    @IBAction func editButton(_ sender: Any) {
    
        print("HELLOOO")
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
}
extension EditVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImg = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            profileImg.image = editedImg
        } else if let originalImg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImg.image = originalImg
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension UITextField {
    func setPadding3(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
    }
    func setButtomBorder1()  {
        self.layer.shadowColor = UIColor.init(red: 45.0/255.0, green: 156.0/255.0, blue: 219.0/255.0, alpha: 1.0).cgColor
        self.layer.shadowOffset = CGSize.init(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

