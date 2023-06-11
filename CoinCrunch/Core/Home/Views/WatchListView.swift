//
//  WatchListView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 31.01.2023.
//

import SwiftUI

struct WatchListView: View {

    @EnvironmentObject private var vm: HomeViewModel

    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    
    var body: some View {
        NavigationView {
            watchListBodyView
                .navigationTitle("Watchlist")
                .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Label("Watchlist", systemImage: "star")
                .accessibilityLabel("Watchlist")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WatchListView()
                .preferredColorScheme(.light)
            WatchListView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(dev.homeVM)
    }
}

extension WatchListView {

    private var watchListBodyView: some View {
        ZStack {
            VStack {
                Spacer(minLength: 12)
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
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.watchListCoins) { coin in
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
