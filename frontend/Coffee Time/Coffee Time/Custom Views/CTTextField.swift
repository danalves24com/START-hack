//
//  CTTextField.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

struct CTTextField: View {
    
    @Binding var input: String
    var placeholder: String
    var action: () -> () = {}
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            ZStack(alignment: .leading) {
                if input.isEmpty {
                    CTText(text: placeholder, font: CTFont.custom(.extraBold, 32), color: CTColor.black.opacity(0.1))
                }
                
                TextField("", text: $input, onCommit: { action() })
                    .font(CTFont.custom(.extraBold, 32).font)
                .foregroundColor(CTColor.blue)
                .multilineTextAlignment(.leading)
            }
            .frame(height: 40)
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(CTColor.black.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
        .animation(nil)
    }
}

