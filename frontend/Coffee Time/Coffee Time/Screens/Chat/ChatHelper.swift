//
//  ChatHelper.swift
//  Coffee Time
//
//  Created by Andre Emmenegger on 20.03.21.
//

import Foundation
import SwiftUI
import Combine

class ChatHelper : ObservableObject {
    
    @Published var messages: [Message] = []
    
    static let shared = ChatHelper()
    private init() {}
    

    func sendMessage(_ chatMessage: Message) {
        messages.append(chatMessage)
        
        let messageModel = SendMessageModel(event: "send_to", data: SendMessageModel.MessageData(to: MainModel.shared.connectedMatch, msg: chatMessage.content))
        BubbleNetworkManager.shared.sendMessage(with: messageModel)
    }
    
    
    func displayReceivedMessage(messageModel: ReceiveMessageModel) {
        let message = Message(content: messageModel.data.message, user: User(name: "Paula", isCurrentUser: false))
        messages.append(message)
    }
}
