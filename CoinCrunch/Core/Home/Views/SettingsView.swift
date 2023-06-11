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

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("general")) {
                    Text("About")
                }
                
                AppearanceView
            }
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
        .easyFullScreenCover(isPresented: $manager.showAppearanceSwitchView) {
            ApperanceModeSwitchView(manager: manager)
        }
        .statusBarHidden(manager.showAppearanceSwitchView)
        .tabItem {
            Label("Settings", systemImage: "gear")
                .accessibilityLabel("Settings")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SettingsView(manager: ColorSchemeManager())
                    .preferredColorScheme(.light)
            }
            NavigationView {
                SettingsView(manager: ColorSchemeManager())
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(dev.csManager)
    }
}

extension SettingsView {
    
    private var AppearanceView: some View {
        Section(header: Text("appearance"), footer: Text("If you choose Device settings, this app will use the mode that's already selected in the device's settings.")) {
            AppearanceSelectionPicker
        }
    }
    
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
