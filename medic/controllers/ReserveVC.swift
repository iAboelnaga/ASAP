//
//  ReserveVC.swift
//  medic
//
//  Created by Aboelnaga on 7/10/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import UIKit

class ReserveVC: UIViewController {

    //var selectedIndex = Int ()
    
    @IBOutlet weak var appointmentCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var selectedIndexes = Int() {
        didSet {
            appointmentCV.reloadData()
        }
    }
    @IBAction func reserve(_ sender: Any)
    {
        let popUp = popUpViewController.create()
        self.addChild(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParent: self)
    }
}
extension ReserveVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReserveCell", for: indexPath) as! ReserveCell
        
        if selectedIndexes == indexPath.row
        {
            cell.backgroundColor = UIColor.green
        }
        else if indexPath.row == 0
        {
            cell.backgroundColor = UIColor.gray
        }
        else
        {
            cell.backgroundColor = UIColor.gray
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //var cell: ReserveCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReserveCell", for: indexPath) as! ReserveCell
        
        selectedIndexes = indexPath.row
        
        //self.appointmentCV.reloadData()
        
        /*
        //cell.backgroundColor = UIColor.blue
        //cell.layer.backgroundColor = UIColor.blue.cgColor
        cell.contentView.backgroundColor = UIColor.blue
        //cell.layer.cornerRadius = 20
        //self.appointmentCV.reloadData()
        print(indexPath.row)
        print(cell.backgroundColor as Any)
 */
    }

}
