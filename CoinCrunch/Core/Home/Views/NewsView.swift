//
//  NewsView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 31.01.2023.
//

import SwiftUI
import Lottie

struct NewsView: View {

    @EnvironmentObject private var vm: HomeViewModel

    @State private var showSettingsView: Bool = false // <- new sheet
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    
    @State private var showPortfolio: Bool = false

    var body: some View {
        NavigationView {
            List {
                Text("Sample New")
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
        .environmentObject(dev.homeVM)
    }
}

extension NewsView {

    private var watchListBodyView: some View {
        ZStack {
            VStack {
                HomeStatsView(showPortfolio: false)
                SearchBarView(searchText: $vm.searchText)

                columnTitles

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

    private var newsHeader: some View {
        HStack {
            Text("News")
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


