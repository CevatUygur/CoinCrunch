//
//  CoinCrunchApp.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 19.01.2023.
//

import SwiftUI

@main
struct CoinCrunchApp: App {
    
    @StateObject var csManager = ColorSchemeManager()
    @StateObject private var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.large)
            }
            .environmentObject(vm)
            .environmentObject(csManager)
            .onAppear {
                csManager.applyColorScheme()
            }
        }
    }
}
