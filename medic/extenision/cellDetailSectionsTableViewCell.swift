//
//  cellDetailSectionsTableViewCell.swift
//  SpecialitySections
//
//  Created by EsraaEid on 6/19/19.
//  Copyright © 2019 Malak. All rights reserved.
//

import UIKit

class cellDetailSectionsTableViewCell: UITableViewCell {

    @IBOutlet weak var DoctorImg: UIImageView!
    @IBOutlet weak var DoctorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DoctorImg.layer.cornerRadius = 15
        DoctorImg.clipsToBounds = true
        DoctorImg.layer.shadowRadius = 2.0
        DoctorImg.layer.shadowColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
