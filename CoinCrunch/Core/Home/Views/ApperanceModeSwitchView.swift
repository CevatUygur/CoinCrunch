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
                VStack {
                    if manager.colorScheme.rawValue == 0 {
                        Image(systemName: "arrow.turn.up.forward.iphone")
                            .font(.system(size: 80))
                            .padding()
                        Text("Device Settings Mode On")
                            .font(.system(size: 20))
                    } else if manager.colorScheme.rawValue == 1 {
                        Image(systemName: "sun.max")
                            .font(.system(size: 80))
                            .padding()
                        Text("Light Mode On")
                            .font(.system(size: 20))
                    } else {
                        Image(systemName: "moon.fill")
                            .font(.system(size: 80))
                            .padding()
                        Text("Dark Mode On")
                            .font(.system(size: 20))
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .edgesIgnoringSafeArea(.all)
            .background(Color.theme.background)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    withAnimation {
                        manager.showAppearanceSwitchView = false
                    }
                }
                
            }
        }
    }
}

//struct DenemeView_Previews: PreviewProvider {
//    static var previews: some View {
//        //DenemeView()
//    }
//}
