//
//  BubbleNetworkManager.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI
import Combine
import Starscream

class BubbleNetworkManager {
    
    static let shared = BubbleNetworkManager()
    private init() {}
    
    var interests: [String] = []
    
    let shouldAdd = PassthroughSubject<(name: String, image: UIImage?), Never>()
    let shouldUpdate = PassthroughSubject<(name: String, count: CGFloat), Never>()
    let shouldDelete = PassthroughSubject<String, Never>()

    var socket: WebSocket!
    var isConnected = false
    let server = WebSocketServer()
    
    func connect(){
        guard let url = URL(string: "ws://ec2-18-220-153-136.us-east-2.compute.amazonaws.com:8001") else { return }
        var request = URLRequest(url: url)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
    }
}


extension BubbleNetworkManager: WebSocketDelegate {
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            print("websocket is connected: \(headers)")
            sendToSocket()
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("Received text: \(string)")
            receiveBubble(string: string)
            receiveMessage(string: string)
            
        case .cancelled:
            isConnected = false
        case .error(_):
            isConnected = false
        default: break
        }
    }
    
    
    func sendToSocket() {
        let userData = UserModel.UserData(UUID: UserDefaultsManager.shared.user_uuid)
        let userModel = UserModel(event: "id_self", data: userData)
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(userModel)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            self.send(s: jsonString)
        } catch { print(error) }
        
        let userInterestData = UserInterestModel.UserData(ITRS: UserDefaultsManager.shared.user_interests)
        let userInterestModel = UserInterestModel(event: "pvd_interests", data: userInterestData)
        
        do {
            let jsonData = try encoder.encode(userInterestModel)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            self.send(s: jsonString)
        } catch { print(error) }
    }
    
    
    func send(s: String){
        socket.write(string: s)
    }
    
    
    func receiveBubble(string: String) {
        let decoder = JSONDecoder()
        
        do {
            let employeeModel = try decoder.decode(EmployeeModel.self, from: Data(string.utf8))
            let newInterests = employeeModel.data.list
            algorithm(newInterests: newInterests)
        } catch {}
    }
    
    
    func algorithm(newInterests: [String]) {
        
        //New Interests?
        //Deleted?
        
        let newOnes = newInterests.filter { !interests.contains($0) }
        let deletedOnes = interests.filter { !newInterests.contains($0) }
        
        if !newOnes.isEmpty {
            newOnes.forEach {
                var image: UIImage? = nil
                if InterestThumbnail.interestWithImages.contains($0) {
                    image = UIImage(named: $0.lowercased())
                }
                shouldAdd.send((name: $0, image: image))
            }
        }
        if !deletedOnes.isEmpty {
            deletedOnes.forEach { shouldDelete.send($0) }
        }
        
        interests = newInterests
    }
    
    
    //MARK: - Chat
    
    func receiveMessage(string: String) {
        let decoder = JSONDecoder()
        
        do {
            let messageModel = try decoder.decode(ReceiveMessageModel.self, from: Data(string.utf8))
            ChatHelper.shared.displayReceivedMessage(messageModel: messageModel)
        } catch {}
    }
    
    
    func sendMessage(with messageModal: SendMessageModel) {
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(messageModal)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            self.send(s: jsonString)
        } catch { print(error) }
    }
}
