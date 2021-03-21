//
//  CTText.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

struct CTText: View {
    
    let text: String
    let font: CTFont
    let color: Color
    let alignment: TextAlignment

    
    init(text: String, font: CTFont, color: Color = CTColor.black, alignment: TextAlignment = .leading) {
        self.text           = text
        self.font           = font
        self.color          = color
        self.alignment      = alignment
    }
    
    
    var body: some View {
        Text(text)
            .font(font.font)
            .foregroundColor(color)
            .multilineTextAlignment(alignment)
    }
}
