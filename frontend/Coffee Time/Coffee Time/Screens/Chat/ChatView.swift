//
//  ChatView.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI


struct ChatView: View {
    
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    
    var body: some View {
        VStack {
           ScrollView {
            ForEach(chatHelper.messages ){ msg in
            //ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
                  MessageView(currentMessage: msg)
                }
           }
           HStack {
               TextField("Message...", text: $typingMessage)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .frame(minHeight: CGFloat(30))
                Button(action: sendMessage) {
                    Text("Send")
                 }
            }.frame(minHeight: CGFloat(50)).padding()
        }
        //EmptyView()
        
    }
    
    func sendMessage() {
        
        chatHelper.sendMessage(Message(content: typingMessage, user: User(name:"me",isCurrentUser: true)))
        typingMessage = ""
        }
}



