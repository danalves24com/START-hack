//
//  MainModel.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

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
    
    
    //Popups
    
    func showTextField(placeholder: String) {
        
    }
}
