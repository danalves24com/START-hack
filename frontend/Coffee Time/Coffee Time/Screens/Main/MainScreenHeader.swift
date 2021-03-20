//
//  MainScreenHeader.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

struct MainScreenHeader: View {
    
    @StateObject private var mainModel = MainModel.shared
    
    
    var body: some View {
        HStack {
            HStack(spacing: 3) {
                SFSymbol.vision
                    .font(.system(size: 15, weight: .thin))
                    .foregroundColor(CTColor.black)
                
                CTText(text: String(mainModel.activeUsers), font: .custom(.semiBold, 22))
            }
            
            Spacer()
            
            SFSymbol.profile
                .font(.system(size: 25, weight: .thin))
                .foregroundColor(CTColor.black)
        }
    }
}
