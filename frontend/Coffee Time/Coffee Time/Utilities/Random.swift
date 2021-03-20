//
//  Random.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

enum CTRandom {
    
    static func generateRandomColor() -> Color {
        let random = Int.random(in: 0...2)
        switch random {
        case 0:     return CTColor.blue
        case 1:     return CTColor.red
        case 2:     return CTColor.green
        default:    return .clear
        }
    }
}
