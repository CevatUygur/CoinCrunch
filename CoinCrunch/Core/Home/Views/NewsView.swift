//
//  NewsView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 31.01.2023.
//

import SwiftUI
import Lottie

struct NewsView: View {

    var body: some View {
        NavigationView {
            List {
                Text("Sample New 1")
                Text("Sample New 2")
            }
            .listStyle(.grouped)
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsView()
        }
    }
}
