//
//  SettingsView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 26.01.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: HomeViewModel
    let defaultURL = URL(string: "https://www.google.com")!
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("general")) {
                    Text("About")
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(dismiss: _dismiss)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
