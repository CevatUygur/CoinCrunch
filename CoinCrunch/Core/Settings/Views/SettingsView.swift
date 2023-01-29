//
//  SettingsView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 26.01.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var current
    @EnvironmentObject var csManager: ColorSchemeManager
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: HomeViewModel
    let defaultURL = URL(string: "https://www.google.com")!
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("general")) {
                    Text("About")
                    
                }
                
                Section(header: Text("appearance".lowercased()), footer: Text("If you choose Device settings, this app will use the mode that's already selected in the device's settings.")) {
                    AppearanceSelectionPicker
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(dismiss: _dismiss)
                }
            }
        }
    }
}

extension SettingsView {

    private var AppearanceSelectionPicker: some View {
        VStack {
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
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ColorSchemeManager())
    }
}
