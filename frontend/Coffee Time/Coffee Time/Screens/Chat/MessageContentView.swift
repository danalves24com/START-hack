//
//  ChatContentView.swift
//  Coffee Time
//
//  Created by Andre Emmenegger on 20.03.21.
//

import SwiftUI

struct MessageContentView: View {
    
    var messageContent: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(messageContent)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}
