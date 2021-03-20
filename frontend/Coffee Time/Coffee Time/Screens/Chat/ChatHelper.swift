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
    //for testing messages
    var m1 = Message(content: "hi", user: User(name:"Thomas", isCurrentUser: true))
    var m2 = Message(content: "hi", user: User(name:"Paula", isCurrentUser: false))
    var m3 = Message(content: "what are you doing", user: User(name:"Thomas", isCurrentUser: true))
    var m4 = Message(content: "Nothing", user: User(name:"Paula", isCurrentUser: false))
    var m5 = Message(content: "You?", user: User(name:"Paula", isCurrentUser: false))
    //var didChange = PassthroughSubject<Void, Never>()
    @Published var messages:[Message]
    init() {
        messages = [m1,m2,m3,m4,m5]
    }
    //@Published var realTimeMessages = {m1,m2,m3,m4,m5}//{}DataSource.messages
    
    
    func sendMessage(_ chatMessage: Message) {
        //realTimeMessages.append(chatMessage)
        messages.append(chatMessage)
        //didChange.send(())
    }
}
