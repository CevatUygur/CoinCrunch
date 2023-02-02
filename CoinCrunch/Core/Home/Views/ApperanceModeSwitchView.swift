//
//  DenemeView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 3.02.2023.
//

import SwiftUI

struct ApperanceModeSwitchView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: ColorSchemeManager
    @Environment(\.easyDismiss) var easyDismiss: EasyDismiss
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                if manager.colorScheme.rawValue == 0 {
                    generateView(imageName: "arrow.turn.up.forward.iphone", textMessage: "Device Settings Mode On")
                } else if manager.colorScheme.rawValue == 1 {
                    generateView(imageName: "sun.max", textMessage: "Light Mode On")
                } else {
                    generateView(imageName: "moon.fill", textMessage: "Dark Mode On")
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .edgesIgnoringSafeArea(.all)
            .background(Color.theme.background)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    withAnimation {
                        manager.showAppearanceSwitchView = false
                    }
                }
            }
        }
    }
    
    func generateView(imageName: String, textMessage: String) -> some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 120))
                .padding()
            Text(textMessage)
                .font(.system(size: 28))
        }
    }
}

//struct DenemeView_Previews: PreviewProvider {
//    static var previews: some View {
//        //DenemeView()
//    }
//}
