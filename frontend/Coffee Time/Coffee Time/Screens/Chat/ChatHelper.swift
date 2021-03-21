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
    
    @Published var messages: [Message]
    
    static let shared = ChatHelper()
    private init() {
        messages = [m1,m2,m3,m4,m5]
    }
    

    var m1 = Message(content: "hi", user: User(name:"Thomas", isCurrentUser: true))
    var m2 = Message(content: "hi", user: User(name:"Paula", isCurrentUser: false))
    var m3 = Message(content: "what are you doing", user: User(name:"Thomas", isCurrentUser: true))
    var m4 = Message(content: "Nothing", user: User(name:"Paula", isCurrentUser: false))
    var m5 = Message(content: "You?", user: User(name:"Paula", isCurrentUser: false))
    
    
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
