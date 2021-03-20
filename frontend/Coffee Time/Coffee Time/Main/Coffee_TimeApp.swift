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
    let chatHelper = ChatHelper()
    
    
    var body: some Scene {
        WindowGroup {
            //ChatContentView(contentMessage: "Hi, I am your friend", isCurrentUser: false)
            //MainScreen()
            
            ChatView().environmentObject(chatHelper)
        }
    }
}
