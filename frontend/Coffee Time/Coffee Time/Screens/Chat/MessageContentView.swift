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
            .background(isCurrentUser ? CTRandom.generateRandomColor() : CTColor.background)
            .cornerRadius(10)
    }
}
