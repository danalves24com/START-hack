//
//  MainScreenTabBar.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

struct MainScreenTabBar: View {
    
    @StateObject private var mainModel = MainModel.shared
    
    var interestsImage: Image { mainModel.activeTab == .interests ? SFSymbol.interestsFill : SFSymbol.interests }
    var topicsImage: Image { mainModel.activeTab == .topics ? SFSymbol.topicsFill : SFSymbol.topics }
    
    
    var body: some View {
        HStack {
            Spacer()
            TabButton(tab: .interests, image: interestsImage, text: "Interests", imageSize: 22)
            Spacer()
            GenerateButton()
                .offset(y: -10)
            Spacer()
            TabButton(tab: .topics, image: topicsImage, text: "Topics", imageSize: 18)
            Spacer()
        }
    }
    
    
    private struct TabButton: View {
        
        @StateObject private var mainModel = MainModel.shared
        
        var tab: ActiveTab
        var image: Image
        var text: String
        var imageSize: CGFloat
        
        
        var body: some View {
            VStack(spacing: 5) {
                image
                    .font(.system(size: imageSize, weight: .light))
                    .foregroundColor(CTColor.black)
                
                CTText(text: text, font: .custom(.regular, 12))
            }
            .frame(width: 72, height: 72)
            .cTItemScaleTapGesture { mainModel.activeTab = tab }
        }
    }
    
    
    private struct GenerateButton: View {
        
        @StateObject private var mainModel = MainModel.shared
        
        var image: Image { mainModel.activeTab == .interests ? SFSymbol.shuffle : SFSymbol.plus }
        
        
        var body: some View {
            VStack {
                image
                    .font(.system(size: 30, weight: .thin))
                    .foregroundColor(CTColor.black)
            }
            .frame(width: 80, height: 80)
            .background(CTColor.background)
            .cornerRadius(24)
            .cTItemScaleTapGesture {
                if mainModel.activeTab == .interests {
                    MatchNetworkManager.match { result in
                        switch result {
                        case let .failure(error): print(error)
                        case let .success(match):
                            print(match)
                        }
                    }
                } else {
                    
                }
            }
        }
    }
}
