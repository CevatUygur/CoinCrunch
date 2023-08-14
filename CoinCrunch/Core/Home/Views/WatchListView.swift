//
//  WatchListView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 31.01.2023.
//

import SwiftUI

struct WatchListView: View {

    //@Environment(\.dismiss) var dismiss
    @State private var showAddToWatchListView: Bool = false // <- new sheet
    @EnvironmentObject private var homevm: HomeViewModel

    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    
    @State private var animationsRunning = false
    
    var body: some View {
        NavigationView {
            watchListBodyView
                .navigationTitle("Watchlist")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        CircleButtonView(iconName: "plus")
                            .padding(.top, 32)
                            .onTapGesture {
                                showAddToWatchListView.toggle()
                            }
                            .sheet(isPresented: $showAddToWatchListView) {
                                AddToWatchlistView()
                                    .environmentObject(homevm)
                            }
                    }
                })
        }
        .tabItem {
            Label("Watchlist", systemImage: "star")
                .accessibilityLabel("Watchlist")
        }
        .navigationBarTitleDisplayMode(.automatic)
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
                if homevm.watchListCoins.isEmpty {
                    emptyView
                        .sheet(isPresented: $showAddToWatchListView) {
                            AddToWatchlistView()
                                .environmentObject(homevm)
                        }
                } else {
                    Spacer(minLength: 12)
                    columnTitles
                    watchListCoinsView
                }
            }
        }
        .background(
            NavigationLink(isActive: $showDetailView, destination: {
                CoinDetailLoadingView(coin: $selectedCoin)
            }, label: { EmptyView() })
        )
    }
    
    private var emptyView: some View {
        VStack {
            VStack{
                
                if #available(iOS 17.0, *) {
                    Image(systemName: "doc.text.magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                        .symbolEffect(.bounce.up.byLayer, value: animationsRunning)
                } else {
                    Image(systemName: "doc.text.magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                }
                
                VStack(spacing: 20) {
                    
                    Text("Find and follow your winning coins")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack {
                            Image(systemName: "star.fill")
                            Text("Choose your favorite coins")
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "newspaper.fill")
                            Text("Get relevant news updates")
                            Text("[SOON]")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(Color.theme.green)
                        }
                        .font(.subheadline)

                        HStack {
                            Image(systemName: "bell.badge.fill")
                            Text("Receive real-time alerts")
                            Text("[SOON]")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(Color.theme.green)
                        }
                        .font(.subheadline)
                    }
                }
                .padding(.top, 20)
            }
            
            Button {
                showAddToWatchListView.toggle()
            } label: {
                Text("Get Started")
                    .fontWeight(.semibold)
                    .frame(width: 320, height: 52)
                    .background(Color.theme.yellow)
                    .foregroundStyle(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.top, 24)
        }
        .onAppear{
            animationsRunning.toggle()
        }
    }
    
    private var watchListCoinsView: some View {
        List {
            ForEach(homevm.watchListCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false, showStar: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
            .onDelete { indexSet in
                for index in indexSet{
                    homevm.updateWatchList(coin: homevm.watchListCoins[index])
                }
            }
            .alignmentGuide(.listRowSeparatorLeading) { _ in
                0
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            homevm.reloadCoinData()
        }
    }
    
    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((homevm.sortCoinsOption == .rank || homevm.sortCoinsOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: homevm.sortCoinsOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    homevm.sortCoinsOption = homevm.sortCoinsOption == .rank ? .rankReversed : .rank
                }
            }
            Spacer()
            HStack(spacing: 4) {
                Text("Current Price")
                Image(systemName: "chevron.down")
                    .opacity((homevm.sortCoinsOption == .price || homevm.sortCoinsOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: homevm.sortCoinsOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 3.2, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default) {
                    homevm.sortCoinsOption = homevm.sortCoinsOption == .price ? .priceReversed : .price
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
