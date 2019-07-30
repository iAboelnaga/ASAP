//
//  Message.swift
//  medic
//
//  Created by Aboelnaga on 7/14/19.
//  Copyright © 2019 graduation_project. All rights reserved.
//

import Foundation
import UIKit
import MessageKit

struct Member {
    let name: String
    let img: UIImage
}

struct Messages {
    let member: Member
    let text: String
    let messageId: String
}
extension Messages: MessageType {
    var sender: Sender {
        return Sender(id: member.name, displayName: member.name)
    }
    
    var sentDate: Date {
        return Date()
    }
    
    var kind: MessageKind {
        return .text(text)
    }
}
