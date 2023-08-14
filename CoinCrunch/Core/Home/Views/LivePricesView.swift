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
    
    @State var show = false
    
    @State private var scaleRatioX = 0.7
    @State private var scaleRatioY = 0.7
        
    private var searchBarAnimation : Bool {
        scaleRatioX == 0.7 ? true : false
    }
    
    @State private var selectedItem = 1
    
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
            
        }
        .tabItem {
            Label("Live Prices", systemImage: "chart.line.uptrend.xyaxis")
                .accessibilityLabel("Live Prices")
        }
        .navigationBarTitleDisplayMode(.automatic)
    }
    
    private var customSearchBarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(searchBarAnimation ? .title2 : .title)
                .foregroundColor(
                    vm.searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search coin...", text: $vm.searchText)
                .frame(height: searchBarAnimation ? 42 : 50, alignment: .leading)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .padding(.trailing, searchBarAnimation ? 0 : 32)
                .onTapGesture {
                    withAnimation {
                        scaleRatioX = 1.0
                        scaleRatioY = 1.0
                    }
                }
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .padding() //<- to extend tappable are for better UX
                        .offset(x: 16) //<- to extend tappable are for better UX
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchBarAnimation ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            vm.searchText = ""
                            withAnimation {
                                scaleRatioX = 0.7
                                scaleRatioY = 0.7
                            }
                            
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding(.vertical, 5)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: searchBarAnimation ? 12 : 12)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10, x: 0, y:0)
        )
        .padding(.horizontal, 12)
        .padding(.vertical, 4)
        .frame(alignment: .center)
        .scaleEffect(CGSize(width: scaleRatioX, height: scaleRatioY), anchor: .center)
    }
    
    private var livePricesBodyView: some View {
        VStack {
            HomeStatsView()
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .padding(.top, 10)
            
            customSearchBarView
                .frame(maxWidth: .infinity)
                .padding(.horizontal, searchBarAnimation ? 88 : 0)
                .padding(.top, searchBarAnimation ? -12 : 0)
            
            columnTitles
                .padding(.top, searchBarAnimation ? -8 : 4)
            
            allCoinsList
                .background(
                    NavigationLink(isActive: $showDetailView, destination: {
                        CoinDetailLoadingView(coin: $selectedCoin)
                    }, label: { EmptyView() })
                )
        }
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
            if vm.allCoins.isEmpty && vm.searchText.isEmpty {
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
                
                
                
            } else {
                ForEach(vm.allCoins) { coin in
                    CoinRowView(coin: coin, showHoldingsColumn: false, showStar: vm.checkWatchList(coin: coin) ? true : false)
                        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                        .onTapGesture {
                            segue(coin: coin)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            if !vm.checkWatchList(coin: coin) {
                                Button {
                                    vm.updateWatchList(coin: coin)
                                } label: {
                                    Label("to Watchlist", systemImage: "plus.square")
                                }
                                .tint(.green)
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
}
