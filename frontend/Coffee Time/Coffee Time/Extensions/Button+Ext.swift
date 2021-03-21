//
//  Button+Ext.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

struct CTScaleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.02 : 1)
    }
}


extension View {
    
    func cTScaleButtonStyle() -> some View {
        self
            .buttonStyle(CTScaleButtonStyle())
            .animation(.easeInOut(duration: 0.1))
    }
}

