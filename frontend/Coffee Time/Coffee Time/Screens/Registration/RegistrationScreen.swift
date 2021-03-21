//
//  RegistrationScreen.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

struct RegistrationScreen: View {
    
    @State private var input: String = ""
    
    
    var body: some View {
        VStack {
            CTText(text: "Welcome to Coffee Time! Please enter your token.", font: .custom(.medium, 24), alignment: .center)
                .padding(.bottom, 50)
            CTTextField(input: $input, placeholder: "Your token.")
                .padding(.bottom, 20)
            
            HStack {
                Spacer()
                CTBorderButton(text: "Continue") {
                    TokenNetworkManager.checkIfValid(with: input) { result in
                        switch result {
                        case let .failure(error):
                            print("Failed with Error \(error.message)")
                        case let .success(token):
                            if token.auth == "success" {
                                MainModel.shared.tokenSuccess = true
                                UserDefaultsManager.shared.firstStart = false
                                UserDefaultsManager.shared.company_uid = token.data.company_uid
                                UserDefaultsManager.shared.user_uuid = token.data.uuid
                                UserDefaultsManager.shared.user_interests = token.data.interests
                                
                                print(token.data.company_uid)
                                print(token.data.uuid)
                                print(token.data.interests)
                            }
                        }
                    }
                }
            }
            
            Spacer()
        }
        .padding(Layout.firstLayerPadding)
        .padding(.vertical, 100)
    }
}
