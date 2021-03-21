//
//  Feedback.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI
import AudioToolbox

struct CLFeedback {
    
    static private let feedbackSupportLevel = UIDevice.current.value(forKey: "_feedbackSupportLevel") as? Int
    
    static func light() {
        switch feedbackSupportLevel {
        case 2: UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case 1: break
        default: break
        }
    }
    
    
    static func rigid() {
        switch feedbackSupportLevel {
        case 2: UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
        case 1: AudioServicesPlaySystemSound(SystemSoundID(1520))
        default: break
        }
    }
}

