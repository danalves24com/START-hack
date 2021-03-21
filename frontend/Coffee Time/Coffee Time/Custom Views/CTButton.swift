//
//  CTBorderButton.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

struct CTBorderButton: View {
    
    let text: String
    let action: () -> ()
    
    
    var body: some View {
        Button(action: { action() }) {
            CTText(text: text.uppercased(), font: .custom(.bold, 18), color: CTColor.black)
                .frame(width: 145 * Layout.multiplierWidth, height: 55)
                .contentShape(Rectangle())
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(CTColor.black.opacity(0.5), lineWidth: 1)
                )
        }
        .cTScaleButtonStyle()
    }
}

