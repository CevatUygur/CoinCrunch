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
    
    @State private var showPortfolioView: Bool = false // <- new sheet
    
    var body: some View {
        TabView(selection: $selectedItem) {
            homeBodyView
                .tag(1)
            PortfolioView()
                .tag(2)
            WatchListView()
                .tag(3)
            NewsView()
                .tag(4)
            SettingsView(manager: manager)
                .tag(5)
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
        NavigationView {
            livePricesBodyView
                .navigationTitle("Live Prices")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        CircleButtonView(iconName: "arrow.clockwise")
                            .padding(.top, 32)
                            .onTapGesture {
                                vm.reloadCoinData()
                            }
                    }
                })
        }
        .tabItem {
            Label("Live Prices", systemImage: "chart.line.uptrend.xyaxis")
                .accessibilityLabel("Live Prices")
        }
        .navigationBarTitleDisplayMode(.automatic)
    }
    
    private var livePricesBodyView: some View {
        VStack {
            HomeStatsView()
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .padding(.top, 10)
            
            AnimatedSearchBarView(searchText: $vm.searchText)
                .frame(maxWidth: .infinity)
            
            columnTitles
            
            allCoinsList
                .background(
                    NavigationLink(isActive: $showDetailView, destination: {
                        CoinDetailLoadingView(coin: $selectedCoin)
                    }, label: { EmptyView() })
                )
                .sheet(isPresented: $showPortfolioView) {
                    EditPortfolioView(coin: $selectedCoin)
                        .environmentObject(vm)
                        .interactiveDismissDisabled()

                }
        }
    }
        
    private var allCoinsList: some View {
        List {
            if vm.allCoins.isEmpty && vm.searchText.isEmpty {
                loadingMessage
            } else {
                ForEach(vm.allCoins) { coin in
                    CoinRowView(coin: coin, showHoldingsColumn: false, showStar: vm.checkWatchList(coin: coin) ? true : false)
                        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                        .onTapGesture {
                            segue(coin: coin)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            if !vm.checkPortfolio(coin: coin) {
                                Button {
                                    segueEdit(coin: coin)
                                } label: {
                                    Label("to Portfolio", systemImage: "plus.square")
                                }
                                .tint(.green)
                            } else {
                                Button {
                                    vm.updatePortfolio(coin: coin, amount: 0.0)
                                } label: {
                                    Label("from Portfolio", systemImage: "trash.fill")
                                }
                                .tint(.red)
                            }
                            if !vm.checkWatchList(coin: coin) {
                                Button {
                                    vm.updateWatchList(coin: coin)
                                } label: {
                                    Label("to Watchlist", systemImage: "star")
                                }
                                .tint(.orange)
                            } else {
                                Button {
                                    vm.updateWatchList(coin: coin)
                                } label: {
                                    Label("from Watchlist", systemImage: "trash.fill")
                                }
                                .tint(.red)
                            }
                        }
                }
                .alignmentGuide(.listRowSeparatorLeading) { _ in
                    0
                }
            }
        }
        .listStyle(.plain)
        .refreshable {
            vm.reloadCoinData()
        }
    }
    
    private var loadingMessage: some View {
        VStack(spacing: 4){
            Text("Trying to fetch data...")
                .font(.callout)
            HStack(spacing: 3){
                Image(systemName: "arrow.down")
                Text("Pull down to refresh")
            }
            .font(.footnote)
        }
        .frame(maxWidth: .infinity)
        .alignmentGuide(.listRowSeparatorLeading) { _ in
            -20
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
            .frame(width: UIScreen.main.bounds.width / 4.2, alignment: .trailing)
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
    
    private func segueEdit(coin: CoinModel) {
        selectedCoin = coin
        showPortfolioView.toggle()
    }
}
