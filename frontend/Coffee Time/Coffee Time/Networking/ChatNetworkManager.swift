//
//  ChatNetworkManager.swift
//  Coffee Time
//
//  Created by Andre Emmenegger on 20.03.21.
//

import Foundation
import Starscream
import SwiftUI




class ChatNetworkManager: WebSocketDelegate{
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        
    }
    
    
    var socket: WebSocket!
    var isConnected = false
    let server = WebSocketServer()
    
    func connect(){
        var request = URLRequest(url: URL(string: URL.ct_URL)!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
    }
    
    
    
    
   
}

