//
//  MainModel.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

enum ActiveTab {
    
    case interests, topics
}

class MainModel: ObservableObject {

    static let shared = MainModel()
    private init() {}
    
    
    @Published var activeTab: ActiveTab = .interests
    
    // Data
    @Published var activeUsers: Int = 0
}
