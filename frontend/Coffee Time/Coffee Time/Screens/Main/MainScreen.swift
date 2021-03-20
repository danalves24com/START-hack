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
                    .padding([.horizontal, .top], Layout.firstLayerPadding)
                MainScreenContent()
                MainScreenTabBar()
                    .padding(.horizontal, Layout.firstLayerPadding)
            }
        }
        .animation(.easeInOut(duration: 0.2))
    }
    
    
    private struct MainScreenContent: View {
        
        @StateObject private var mainModel = MainModel.shared
        @GestureState private var dragOffset: CGFloat = .zero
        
        var showInterests: Bool { mainModel.activeTab == .interests || dragOffset != 0 }
        var showTopics: Bool { mainModel.activeTab == .topics || dragOffset != 0 }
        
        
        var body: some View {
            HStack(spacing: Layout.firstLayerPadding) {
                InterestsScreen()
                    .frame(width: Layout.firstLayerWidth)
                    .padding(.leading, Layout.firstLayerPadding)
                    .opacity(showInterests ? 1 : 0)
                
                TopicsScreen()
                    .frame(width: Layout.firstLayerWidth)
                    .padding(.trailing, Layout.firstLayerPadding)
                    .opacity(showTopics ? 1 : 0)
            }
            .frame(width: Layout.screenWidth, alignment: .leading)
            .gesture(
                DragGesture(minimumDistance: 10, coordinateSpace: .global)
                    .updating($dragOffset) { value, state, transaction in
                        if state <= 0 && mainModel.activeTab == .interests
                            || state >= 0 && mainModel.activeTab == .topics {
                            state = value.translation.width
                        }
                    }
                    .onEnded { value in
                        let state = value.translation.width
                        
                        if state < -50 && mainModel.activeTab == .interests {
                            mainModel.activeTab = .topics
                        }
                        if state > 50 && mainModel.activeTab == .topics {
                            mainModel.activeTab = .interests
                        }
                    }
            )
            .offset(x: dragOffset + mainModel.activeTab.offset)
        }
    }
}
