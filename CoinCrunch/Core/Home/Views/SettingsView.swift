//
//  ProfileView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 28.01.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var manager: ColorSchemeManager
    
    @Environment(\.colorScheme) var current
    @EnvironmentObject var csManager: ColorSchemeManager
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolioView: Bool = false // <- new sheet
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("general")) {
                    Text("About")
                }
                
                Section(header: Text("appearance"), footer: Text("If you choose Device settings, this app will use the mode that's already selected in the device's settings.")) {
                    AppearanceSelectionPicker
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
        .easyFullScreenCover(isPresented: $manager.showAppearanceSwitchView) {
            ApperanceModeSwitchView(manager: manager)
        }
        .statusBarHidden(manager.showAppearanceSwitchView)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            //MenuView()
        }
        .environmentObject(dev.homeVM)
    }
}

extension SettingsView {
    
    private var AppearanceSelectionPicker: some View {

        Picker("App Theme", selection: $csManager.colorScheme) {
            Text("Device settings")
                .tag(ColorScheme.unspecified)
            Text("Dark mode")
                .tag(ColorScheme.dark)
            Text("Light mode")
                .tag(ColorScheme.light)
        }
        .pickerStyle(.automatic)
    }
}
