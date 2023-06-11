//
//  NewsView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 7.06.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedNew: News?
    @State private var showDetailView: Bool = false
    
    var body: some View {
        NavigationView {
            bodyView
        }
        .tabItem {
            Label("News", systemImage: "newspaper")
                .accessibilityLabel("News")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func segue(new: News) {
        selectedNew = new
        showDetailView.toggle()
    }
}

extension NewsView {
    
    private var bodyView: some View {
        List {
            ForEach(vm.allNews) { new in
                ZStack {
                    HStack(alignment: .center, spacing: 8) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(new.title)
                                .font(.subheadline)
                                .padding(.top, 12)
                            Text(Date().timeIntervalToDateAndTimeString(timeIn: new.publishedOn) + " | " + new.sourceInfo.name.capitalized)
                                .font(.caption2)
                                .foregroundColor(Color.theme.secondaryText)
                                .padding(.bottom, 12)
                        }
                        Spacer()
                        WebImage(url: URL(string: new.imageurl))
                            .placeholder {
                                ProgressView()
                            }
                            .resizable()
                            .frame(width: 80, height: 80)
                            .scaledToFit()
                            .cornerRadius(10)
                    }
                }
                .onTapGesture {
                    segue(new: new)
                    print("\(new.title) tapped")
                }
            }
            .listRowSeparatorTint(Color.theme.secondaryText)
        }
        .listStyle(PlainListStyle())
        .refreshable {
            vm.reloadNewsData()
        }
        .navigationTitle("News")
        .navigationBarTitleDisplayMode(.inline)
        .background(
            NavigationLink(isActive: $showDetailView, destination: {
                NewsDetailLoadingView(new: $selectedNew)
            }, label: { EmptyView() })
        )
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsView()
                .preferredColorScheme(.light)
            NewsView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(dev.homeVM)
    }
}
