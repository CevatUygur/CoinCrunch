//
//  ProfileView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 28.01.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Profile View Text")
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
