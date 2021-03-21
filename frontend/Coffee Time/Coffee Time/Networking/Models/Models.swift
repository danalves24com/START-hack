//
//  Models.swift
//  Coffee Time
//
//  Created by Kai Zheng on 21.03.21.
//

import Foundation

struct UserModel: Codable {
    var event: String
    var data: UserData
    
    struct UserData: Codable {
        var UUID: String
    }
}


struct UserInterestModel: Codable {
    var event: String
    var data: UserData
    
    struct UserData: Codable {
        var ITRS: [String]
    }
}


struct EmployeeModel: Codable {
    var status: String
    var event: String
    var data: EmployeeData
    
    struct EmployeeData: Codable {
        var list: [String]
        var size: Int
    }
}


struct SendMessageModel: Codable {
    var event: String
    var data: MessageData
    
    struct MessageData: Codable {
        var to: String
        var msg: String
    }
}


struct ReceiveMessageModel: Codable {
    var event: String
    var data: MessageData
    
    struct MessageData: Codable {
        var origin: String
        var message: String
    }
}
