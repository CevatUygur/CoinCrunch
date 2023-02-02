//
//  EasyFullScreenCover.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 3.02.2023.
//

import SwiftUI

struct EasyFullScreenCover<Content: View>: View {
    @Binding var isPresented: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            content
                .environment(\.easyDismiss, EasyDismiss {
                    isPresented = false
                })
        }
    }
}

extension View {
    func easyFullScreenCover<Content>(isPresented: Binding<Bool>, transition: AnyTransition = .opacity, content: @escaping () -> Content) -> some View where Content : View {
        ZStack {
            self
            
            ZStack { // for correct work of transition animation
                if isPresented.wrappedValue {
                    EasyFullScreenCover(isPresented: isPresented, content: content)
                        .transition(.opacity)
                }
            }
        }
    }
}

struct EasyDismiss {
    private var action: () -> Void
    func callAsFunction() {
        action()
    }
    
    init(action: @escaping () -> Void = { }) {
        self.action = action
    }
}

struct EasyDismissKey: EnvironmentKey {
    static var defaultValue: EasyDismiss = EasyDismiss()
}

extension EnvironmentValues {
    var easyDismiss: EasyDismiss {
        get { self[EasyDismissKey.self] }
        set { self[EasyDismissKey.self] = newValue }
    }
}

extension UIApplication {
    var key: UIWindow? {
        self.connectedScenes
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?
            .windows
            .filter({$0.isKeyWindow})
            .first
    }
}

extension UIView {
    func allSubviews() -> [UIView] {
        var subs = self.subviews
        for subview in self.subviews {
            let rec = subview.allSubviews()
            subs.append(contentsOf: rec)
        }
        return subs
    }
}
