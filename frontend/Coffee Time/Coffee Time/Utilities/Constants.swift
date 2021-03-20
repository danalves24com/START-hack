//
//  Constants.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI

enum Layout {
    
    static let screenWidth                  = UIScreen.main.bounds.size.width
    static let screenHeight                 = UIScreen.main.bounds.size.height
    
    static let multiplierWidth: CGFloat     = screenWidth/375.0
    static let multiplierHeight: CGFloat    = screenHeight/812.0
    
    static let firstLayerPadding: CGFloat   = 24.0
    static let firstLayerWidth              = screenWidth - (2.0 * firstLayerPadding)
    
    
    static func onlyOniPhoneXType(_ value: CGFloat) -> CGFloat {
        return Device.isiPhoneXType ? value : 0
    }
}
    
    
enum Device {
        
    static let idiom                        = UIDevice.current.userInterfaceIdiom
    static let nativeScale                  = UIScreen.main.nativeScale
    static let scale                        = UIScreen.main.scale
    
    static let isiPhoneSE                   = idiom == .phone && Layout.screenHeight == 568.0
    static let isiPhone8Standard            = idiom == .phone && Layout.screenHeight == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed              = idiom == .phone && Layout.screenHeight == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard        = idiom == .phone && Layout.screenHeight == 736.0
    static let isiPhone8PlusZoomed          = idiom == .phone && Layout.screenHeight == 736.0 && nativeScale < scale
    static let isiPhoneXAnd11And12Mini      = idiom == .phone && Layout.screenHeight == 812.0
    static let isiPhoneXsMaxAndXrAnd11Max   = idiom == .phone && Layout.screenHeight == 896.0
    static let isiPhone12                   = idiom == .phone && Layout.screenHeight == 844.0
    static let isiPhone12ProMax             = idiom == .phone && Layout.screenHeight == 926.0

    static private let isiPhone12Type: Bool = { return isiPhone12 || isiPhone12ProMax }()
    static let isiPhoneXType: Bool = { return isiPhoneXAnd11And12Mini || isiPhoneXsMaxAndXrAnd11Max || isiPhone12Type }()
}


enum SafeAreaSize {
    
    static let topX: CGFloat        = 44.0
    static let bottomX: CGFloat     = 34.0
    static let topRest: CGFloat     = 20.0
    static let bottomRest: CGFloat  = 0.0
    
    static let top                  = Device.isiPhoneXType ? topX : topRest
    static let bottom               = Device.isiPhoneXType ? bottomX : bottomRest
}


enum CTURL {
    
    static let chat: String         = "test"
}


enum SFSymbol {
    
    static let vision               = Image(systemName: "eye.fill")
    static let profile              = Image(systemName: "person.fill")
    static let interestsFill        = Image(systemName: "sun.min.fill")
    static let topicsFill           = Image(systemName: "bubble.right.fill")
    static let interests            = Image(systemName: "sun.min")
    static let topics               = Image(systemName: "bubble.right")
    static let plus                 = Image(systemName: "plus")
    static let shuffle              = Image(systemName: "hand.wave")
}


enum CTColor {
    
    static let white                = Color("ColorWhite")
    static let black                = Color("ColorBlack")
    static let background           = Color("ColorBackground")
    
    static let blue                 = Color("ColorBlue")
    static let green                = Color("ColorGreen")
    static let red                  = Color("ColorRed")
}


enum CTFont {
    
    case custom(Montserrat, CGFloat)

    var font: Font {
        switch self {
        case let .custom(weight, size):
            return Font.custom(weight.weight, size: size)
        }
    }
}


enum Montserrat: String {

    case extraBold    = "Montserrat-ExtraBold"
    case bold         = "Montserrat-Bold"
    case semiBold     = "Montserrat-SemiBold"
    case medium       = "Montserrat-Medium"
    case regular      = "Montserrat-Regular"
    case light        = "Montserrat-Light"
    case extraLight   = "Montserrat-ExtraLight"
    case thin         = "Montserrat-Thin"
    
    var weight: String { return self.rawValue }
}


enum InterestThumbnail {
    
    static let meditation: UIImage   = UIImage(named: "")!
}



