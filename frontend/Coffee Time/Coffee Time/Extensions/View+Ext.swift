//
//  View+Ext.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

extension View {
    
    func cTItemScaleTapGesture(amount scale: CGFloat = 1.05, with onTapBlock: @escaping () -> () = {}) -> some View {
        return modifier(CTItemSclaeTapGesture(scale: scale, onTapBlock: onTapBlock))
    }
}


fileprivate struct CTItemSclaeTapGesture: ViewModifier {
    
    @State private var tapAnimation = false
    let scale: CGFloat
    let onTapBlock: () -> ()
    
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(tapAnimation ? scale : 1.0)
            .onTapGesture {
                onTapBlock()
                tapAnimation = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { tapAnimation = false }
            }
    }
}
