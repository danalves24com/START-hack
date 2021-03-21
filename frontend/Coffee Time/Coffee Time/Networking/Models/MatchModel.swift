//
//  MatchModel.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import Foundation

struct MatchModel: Codable {
    var status: String
    var data: MatchData
    
    struct MatchData: Codable {
        var bestMatch: String
    }
}
