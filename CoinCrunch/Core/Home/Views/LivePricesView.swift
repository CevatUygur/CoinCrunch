//
//  HomeView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 19.01.2023.
//

import SwiftUI
import HidableTabView

struct LivePricesView: View {

    @EnvironmentObject private var vm: HomeViewModel
    @StateObject var manager: ColorSchemeManager
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    @State private var showPortfolio: Bool = false
    
    @State private var selectedItem = 1
    
    var body: some View {
        TabView(selection: $selectedItem) {
            if #available(iOS 16.0, *) {
                homeBodyView
                    .toolbar(.hidden, for: .navigationBar)
                    .tag(1)
            } else {
                // Fallback on earlier versions
                homeBodyView
                    .navigationBarHidden(true)
                    .tag(1)
            }

            if #available(iOS 16.0, *) {
                PortfolioView()
                    .toolbar(.hidden, for: .navigationBar)
                    .tag(2)
            } else {
                // Fallback on earlier versions
                PortfolioView()
                    .navigationBarHidden(true)
                    .tag(2)
            }
            
            if #available(iOS 16.0, *) {
                WatchListView()
                    .toolbar(.hidden, for: .navigationBar)
                    .tag(3)
            } else {
                // Fallback on earlier versions
                WatchListView()
                    .navigationBarHidden(true)
                    .tag(3)
            }
            
            if #available(iOS 16.0, *) {
                NewsView()
                    .toolbar(.hidden, for: .navigationBar)
                    .tag(4)
            } else {
                // Fallback on earlier versions
                NewsView()
                    .navigationBarHidden(true)
                    .tag(4)
            }

            if #available(iOS 16.0, *) {
                SettingsView(manager: manager)
                    .toolbar(.hidden, for: .navigationBar)
                    .tag(5)
            } else {
                // Fallback on earlier versions
                SettingsView(manager: manager)
                    .navigationBarHidden(true)
                    .tag(5)
            }
        }
        .accentColor(Color.theme.accent)
        .onChange(of: selectedItem) { value in
            print("selected tab = \(value)")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                LivePricesView(manager: ColorSchemeManager())
                    .preferredColorScheme(.light)
            }
            NavigationView {
                LivePricesView(manager: ColorSchemeManager())
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(dev.homeVM)
        .environmentObject(dev.csManager)
    }
}

extension LivePricesView {

    private var homeBodyView: some View {
        ZStack {
            VStack {
                homeHeader
                
                HomeStatsView()
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    
                
                SearchBarView(searchText: $vm.searchText)
                columnTitles
                allCoinsList
                Spacer(minLength: 0)
            }
        }
        .background(
            NavigationLink(isActive: $showDetailView, destination: {
                CoinDetailLoadingView(coin: $selectedCoin)
            }, label: { EmptyView() })
        )
        .tabItem {
            Label("Live Prices", systemImage: "chart.line.uptrend.xyaxis")
                .accessibilityLabel("Live Prices")
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private var homeHeader: some View {
        HStack {
            Text("Live Prices")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "info")
                .onTapGesture {
                    print("Live Prices info button tapped")
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
            vm.reloadCoinData()
        }
    }

    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortCoinsOption == .rank || vm.sortCoinsOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortCoinsOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortCoinsOption = vm.sortCoinsOption == .rank ? .rankReversed : .rank
                }
            }
            Spacer()
            HStack(spacing: 4) {
                Text("Current Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortCoinsOption == .price || vm.sortCoinsOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortCoinsOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 3.2, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortCoinsOption = vm.sortCoinsOption == .price ? .priceReversed : .price
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

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}
