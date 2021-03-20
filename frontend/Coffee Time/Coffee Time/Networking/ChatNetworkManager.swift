//
//  ChatNetworkManager.swift
//  Coffee Time
//
//  Created by Andre Emmenegger on 20.03.21.
//

import SwiftUI
import Starscream

class ChatNetworkManager {
    
    static var shared = ChatNetworkManager()
    private init() {}
    
    var socket: WebSocket!
    var isConnected = false
    let server = WebSocketServer()
    
    
    func connect(){
        guard let url = URL(string: CTURL.chat) else { return }
        var request = URLRequest(url: url)
        
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
    }
}


extension ChatNetworkManager: WebSocketDelegate {
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        
    }
}

