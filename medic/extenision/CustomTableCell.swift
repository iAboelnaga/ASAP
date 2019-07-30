//
//  CustomTableCell.swift
//  medic
//
//  Created by Aboelnaga on 5/9/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {

    
    @IBOutlet weak var userPP: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
