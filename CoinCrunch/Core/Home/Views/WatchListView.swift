//
//  WatchListView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 31.01.2023.
//

import SwiftUI
import Lottie

struct WatchListView: View {

    @EnvironmentObject private var vm: HomeViewModel

    @State private var showSettingsView: Bool = false // <- new sheet
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    
    @State private var showPortfolio: Bool = false

    var body: some View {
        NavigationView {
            watchListBodyView
                .navigationTitle("Watchlist")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WatchListView()
        }
        .environmentObject(dev.homeVM)
    }
}

extension WatchListView {

    private var watchListBodyView: some View {
        ZStack {
            VStack {

                //columnTitles

                allCoinsList
                    .transition(.move(edge: .leading))

                Spacer(minLength: 0)
            }
        }
        .background(
            NavigationLink(isActive: $showDetailView, destination: {
                DetailLoadingView(coin: $selectedCoin)
            }, label: { EmptyView() })
        )
    }

    private var watchListHeader: some View {
        HStack {
            Text("Watch List")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 19)
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

