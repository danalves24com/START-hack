//
//  TopicsScreen.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

struct TopicsScreen: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                ForEach(0..<10, id: \.self) { i in
                    TopicsRow(index: i)
                }
            }
            .frame(width: Layout.firstLayerWidth)
            .padding(.bottom, 50)
        }
        .padding(.top, 20)
    }
    
    
    private struct TopicsRow: View {
        
        let index: Int
        
        
        var body: some View {
            HStack {
                CTText(text: "Sample \(index)", font: .custom(.medium, 18), color: CTColor.white)
                
                Spacer()
                
                VStack {
                    VStack {
                        CTText(text: "\(index) s", font: .custom(.bold, 14), color: CTColor.black)
                    }
                    .frame(width: 50, height: 24)
                    .background(CTColor.white)
                    .cornerRadius(8)
                    
                    Spacer()
                }
            }
            .padding(16)
            .padding(.horizontal, 4)
            .frame(maxWidth: .infinity)
            .frame(height: 90)
            .background(CTRandom.generateRandomColor())
            .cornerRadius(20)
        }
    }
}
