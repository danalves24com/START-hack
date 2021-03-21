//
//  TokenModel.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import Foundation

struct TokenModel: Codable {
    var auth: String
    var data: TokenData
    
    struct TokenData: Codable {
        var uuid: String
        var company_uid: String
        var interests: [String]
    }
}
