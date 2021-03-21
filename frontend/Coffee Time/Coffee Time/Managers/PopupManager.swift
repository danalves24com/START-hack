//
//  PopupManager.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI
import Combine

final class PopupManager: ViewOverlayManagerProtocol {
    
    static let shared = PopupManager()
    private init() {}
    
    @Published var transition: TransitionManager<PopupManager> = TransitionManager()

    @Published var dismissOnTapOutside: Bool!
    @Published var dismissOnTapInside: Bool!
    @Published var tapDismissableDelay: DispatchTimeInterval!
    @Published var hapticFeedback: Bool!
    
    @Published var blurColor: Color!
    @Published var backgroundColor: Color!
    @Published var height: CGFloat!
    @Published var withPadding: Bool!
    @Published var content: () -> AnyView = { AnyView(EmptyView()) }
    
    let dismissed = PassthroughSubject<Void, Never>()
    
    
    //MARK: - Transition
    
    func initTransition() {
        CLFeedback.rigid()
        defaultInitTransition()
    }
    
    
    //MARK: - Show
    
    func showPopup<T: View>(
        height: CGFloat                             = 360*Layout.multiplierWidth,
        withPadding: Bool                           = true,
        dismissOnTapOutside: Bool                   = true,
        dismissOnTapInside: Bool                    = false,
        hapticFeedback: Bool                        = false,
        content: @escaping () -> T
    ) {
        DispatchQueue.main.async {
            self.initTransition()
            
            self.dismissOnTapOutside    = false
            self.dismissOnTapInside     = false
            DispatchQueue.main.asyncAfter(deadline: .now() + self.tapDismissableDelay) {
                self.dismissOnTapOutside    = dismissOnTapOutside
                self.dismissOnTapInside     = dismissOnTapInside
            }
  
            self.height                 = height
            self.withPadding            = withPadding
            
            self.content                = { AnyView(content()) }
        }
    }
    
    
    //MARK: - Dismiss
    
    func dismiss() {
        defaultDismiss()
    }
}

