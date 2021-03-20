//
//  MainScreen.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

struct MainScreen: View {
    
    var body: some View {
        ZStack {
            CTColor.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                MainScreenHeader()
                Spacer()
                MainScreenTabBar()
            }
            .padding([.horizontal, .top], Layout.firstLayerPadding)
        }
    }
}
