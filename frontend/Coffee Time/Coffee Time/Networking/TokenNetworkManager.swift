//
//  TokenNetworkManager.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

final class TokenNetworkManager {
    
    static func checkIfValid(with input: String, completion: @escaping (Result<TokenModel, NetworkError>) -> ()) {
        let urlString = "http://ec2-18-220-153-136.us-east-2.compute.amazonaws.com:4891/login/\(input)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.unknown))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let token = try decoder.decode(TokenModel.self, from: data)
                    completion(.success(token))
                } catch {
                    completion(.failure(.unknown))
                    return
                }
                
            } else {
                completion(.failure(.unknown))
                return
            }
        }

        task.resume()
    }
}

