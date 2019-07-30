//
//  postsCells.swift
//  medic
//
//  Created by EsraaEid on 7/6/19.
//  Copyright © 2019 Malak. All rights reserved.
//

import UIKit

class postsCells: UITableViewCell {

    @IBOutlet weak var PostArea: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func likeAction(_ sender: Any)
    {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
