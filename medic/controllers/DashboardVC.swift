//
//  DashboardVC.swift
//  medic
//
//  Created by Aboelnaga on 5/5/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import UIKit
import Kingfisher

class DashboardVC: UIViewController {

    @IBOutlet weak var recommendedCV: UICollectionView!
    @IBOutlet weak var sectionCV: UICollectionView!
    @IBOutlet weak var sideM: UIButton!
    
    var sec : Sections?
    var rec : Recommended?
    var secName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let revealViewController = self.revealViewController()
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        sideM.addTarget(revealViewController, action:#selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        handleRefresh()
        handleRefresh2()
    }
    private func handleRefresh(){
        ApiRequests.section { (error: Error?, section: Sections?) in
            if let section = section {
                self.sec = section
                self.sectionCV.reloadData()
            }
        }
    }
    private func handleRefresh2(){
        ApiRequests.recommend { (error: Error?, section: Recommended?) in
            if let section = section {
                self.rec = section
                self.recommendedCV.reloadData()
            }
        }
    }
    @IBAction func userP(_ sender: Any)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
}
extension DashboardVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recommendedCV {
            guard let count = (rec?.doctors?.data?.count) else{
                return 0        }
            return count
        }
        if collectionView == sectionCV {
            guard let count = (sec?.sections?.data?.count) else{
                return 0        }
            return count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : CustomCell!
        
        if collectionView == recommendedCV {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as? CustomCell
            
            let imageString = (rec?.doctors?.data![indexPath.row].user?.avatar)!
            let imagesUrl = URL(string: imageString)!
            print(imagesUrl)
            cell.docImg?.kf.setImage(with: imagesUrl)
            
            cell.layer.cornerRadius = 65
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.blue.cgColor
        }
        if collectionView == sectionCV {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as? CustomCell

            //cell.secName?.text = sec?.sections?.data![indexPath.row].name
            
            let imageString = (sec?.sections?.data![indexPath.row].image)!
            let imagesUrl = URL(string: imageString)!
            print(imagesUrl)
            cell.secImg?.kf.setImage(with: imagesUrl)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == sectionCV {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "sectionsViewController") as! sectionsViewController
            profile.secName = sec?.sections?.data![indexPath.row].name
            profile.id = sec?.sections?.data![indexPath.row].id
        self.navigationController?.pushViewController(profile, animated: true)
        }
        if collectionView == recommendedCV {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let profile = storyBoard.instantiateViewController(withIdentifier: "DoctorProfileVC") as! DoctorProfileVC
            //profile.secName = rec?.doctors?.data![indexPath.row].section?.name
            profile.id = rec?.doctors?.data![indexPath.row].user?.id
            self.navigationController?.pushViewController(profile, animated: true)
        }

    }
}
