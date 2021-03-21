import SwiftUI

struct ChatView: View {

    @State private var typingMessage: String = ""
    @StateObject private var chatHelper = ChatHelper.shared


    var body: some View {
        VStack {
            VStack {
                CTText(text: "Guitar", font: .custom(.semiBold, 24))
                CTText(text: "Paula", font: .custom(.regular, 15))
            }
            .frame(minHeight: CGFloat(50)).padding()
           ScrollView {
                ForEach(chatHelper.messages ){ msg in
                  MessageView(currentMessage: msg)
                }
           }
           HStack {
               TextField("Message...", text: $typingMessage)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .frame(minHeight: CGFloat(30))

                Button(action: sendMessage) {
                    CTText(text: "Send", font: .custom(.semiBold, 18))
                 }
           }
           .frame(minHeight: CGFloat(50)).padding()
        }
    }

    func sendMessage() {
        chatHelper.sendMessage(Message(content: typingMessage, user: User(name:"me",isCurrentUser: true)))
        typingMessage = ""
    }
}
