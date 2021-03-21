//
//  ChatModel.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import Foundation

struct Message:Identifiable {
    
    var content: String
    var user: User
    var id = UUID()
}


struct User {
    
    var name: String
    var isCurrentUser: Bool = false
}
