//
//  MainModel.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI
import Combine

enum ActiveTab {
    
    case interests, topics
    
    var offset: CGFloat {
        switch self {
        case .interests:    return 0
        case .topics:       return -(Layout.screenWidth-Layout.firstLayerPadding)
        }
    }
}

class MainModel: ObservableObject {

    static let shared = MainModel()
    private init() {}
    
    
    @Published var activeTab: ActiveTab = .interests
    
    // Data
    @Published var activeUsers: Int = 0
    @Published var connectedMatch: String = ""
    
    @Published var showChat: Bool = false
    @Published var tokenSuccess: Bool = !UserDefaultsManager.shared.firstStart
    
    
    //Popups
    
    func showTextField(placeholder: String) {
        
    }
}
