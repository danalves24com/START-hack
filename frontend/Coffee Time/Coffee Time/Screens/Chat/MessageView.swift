//
//  MessageView.swift
//  Coffee Time
//
//  Created by Andre Emmenegger on 20.03.21.
//

import Foundation
import SwiftUI

struct MessageView : View {
    var currentMessage: Message
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if currentMessage.user.isCurrentUser {
                Spacer()
                MessageContentView(messageContent: currentMessage.content,
                               isCurrentUser: currentMessage.user.isCurrentUser)
            } else{
                MessageContentView(messageContent: currentMessage.content,
                               isCurrentUser: currentMessage.user.isCurrentUser)
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 3)
    }
}

