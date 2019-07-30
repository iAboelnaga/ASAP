//
//  sectionsViewController.swift
//  SpecialitySections
//
//  Created by EsraaEid on 6/19/19.
//  Copyright © 2019 Malak. All rights reserved.
//

import UIKit
import Kingfisher

class sectionsViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var secNameLabel: UILabel!
    @IBOutlet weak var sideM: UIButton!
    
    var sec:DocSections?
    var secName: String?
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let revealViewController = self.revealViewController()
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        sideM.addTarget(revealViewController, action:#selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        handler()
        if secName != nil {
            secNameLabel.text = secName
        }
    }
    private func handler(){
        ApiRequests.section(id: id!) { ( error : Error?,section: DocSections?) in
            if let section = section {
                self.sec = section
                self.tableView.reloadData()
            }
    }
  }
}
extension sectionsViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // let  count = (sec?.doctors?.data?.count)
        if let s = self.sec{
            guard let  count = (s.doctors?.data?.count) else{
               return 0        }
            return count
       }
        else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : cellDetailSectionsTableViewCell
       
        cell = tableView.dequeueReusableCell(withIdentifier: "cellSec", for: indexPath) as! cellDetailSectionsTableViewCell

        cell.DoctorName?.text = sec?.doctors?.data![indexPath.row].user?.name
    
        let imageString = (sec?.doctors?.data![indexPath.row].user?.avatar)!
        let imagesUrl = URL(string: imageString)!
        cell.DoctorImg?.kf.setImage(with: imagesUrl)

        return cell
  }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "DoctorProfileVC") as! DoctorProfileVC
        profile.id = sec?.doctors?.data![indexPath.row].user?.id
        self.navigationController?.pushViewController(profile, animated: true)
    }
}

