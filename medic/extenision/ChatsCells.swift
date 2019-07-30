//
//  ChatsCells.swift
//  medic
//
//  Created by EsraaEid on 7/7/19.
//  Copyright © 2019 Malak. All rights reserved.
//

import UIKit

class ChatsCells: UITableViewCell {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userNameC: UILabel!
    @IBOutlet weak var lastMsg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
