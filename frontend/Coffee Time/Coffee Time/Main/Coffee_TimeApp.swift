//
//  Coffee_TimeApp.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

@main
struct Coffee_TimeApp: App {
    
    let mainModel = MainModel.shared 
    
    
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
}
