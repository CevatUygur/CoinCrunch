//
//  HomeView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 19.01.2023.
//

import SwiftUI
import Lottie

struct LivePricesView: View {

    @EnvironmentObject private var vm: HomeViewModel

    @State private var showSettingsView: Bool = false // <- new sheet
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    
    @State private var showPortfolio: Bool = false

    var body: some View {
        TabView {
            if #available(iOS 16.0, *) {
                homeBodyView
                    .tabItem {
                        Label("Live Prices", systemImage: "chart.line.uptrend.xyaxis")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden)
            } else {
                // Fallback on earlier versions
                homeBodyView
                    .tabItem {
                        Label("Live Prices", systemImage: "chart.line.uptrend.xyaxis")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }

            if #available(iOS 16.0, *) {
                PortfolioView()
                    .tabItem {
                        Label("Portfolio", systemImage: "chart.pie")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden)
            } else {
                // Fallback on earlier versions
                PortfolioView()
                    .tabItem {
                        Label("Portfolio", systemImage: "chart.pie")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }
            
            if #available(iOS 16.0, *) {
                WatchListView()
                    .tabItem {
                        Label("Watch List", systemImage: "star")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden)
            } else {
                // Fallback on earlier versions
                WatchListView()
                    .tabItem {
                        Label("Watch List", systemImage: "star")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }

            if #available(iOS 16.0, *) {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden)
            } else {
                // Fallback on earlier versions
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }
        }
        .accentColor(Color.theme.accent)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LivePricesView()
        }
        .environmentObject(dev.homeVM)
    }
}

extension LivePricesView {

    private var homeBodyView: some View {
        ZStack {
            VStack {
                homeHeader
                HomeStatsView(showPortfolio: false)
                SearchBarView(searchText: $vm.searchText)

                columnTitles

                allCoinsList
                    .transition(.move(edge: .leading))

                Spacer(minLength: 0)
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
        }
        .background(
            NavigationLink(isActive: $showDetailView, destination: {
                DetailLoadingView(coin: $selectedCoin)
            }, label: { EmptyView() })
        )
    }

    private var homeHeader: some View {
        HStack {
            Text("Live Prices")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "line.3.horizontal")
                .onTapGesture {
                    showSettingsView.toggle()
                }
        }
        .padding(.horizontal)
    }

    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            vm.reloadData()
        }
    }

    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }

            Spacer()

            HStack(spacing: 4) {
                Text("Current Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 3.2, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            }

        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }

    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView.toggle()
    }

}
