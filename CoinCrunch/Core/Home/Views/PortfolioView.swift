//
//  PortfolioView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 28.01.2023.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolioView: Bool = false // <- new sheet
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    
    @State private var animationsRunning = false
    
    var body: some View {
        NavigationView {
            portfolioBodyView
                .navigationTitle("Portfolio")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        CircleButtonView(iconName: "plus")
                            .padding(.top, 32)
                            .onTapGesture {
                                showPortfolioView.toggle()
                            }
                            .sheet(isPresented: $showPortfolioView) {
                                EditPortfolioView()
                                    .environmentObject(vm)
                            }
                    }
                })
        }
        .tabItem {
            Label("Portfolio", systemImage: "chart.pie")
                .accessibilityLabel("Portfolio")
        }
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                PortfolioView()
                    .preferredColorScheme(.light)
            }
            NavigationView {
                PortfolioView()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(dev.homeVM)
    }
}

extension PortfolioView {
    
    private var portfolioBodyView: some View {
        VStack {
            HomeStatsView()
                .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                .padding(.top, 10)
           
            AnimatedSearchBarView(searchText: $vm.searchText)
                .frame(maxWidth: .infinity)
            
            columnTitles
            
            portfolioCoinsList
                .background(
                    NavigationLink(isActive: $showDetailView, destination: {
                        CoinDetailLoadingView(coin: $selectedCoin)
                    }, label: { EmptyView() })
                )
        }
    }
    
    private var portfolioCoinsList: some View {
        List {
            if vm.portfolioCoins.isEmpty && vm.searchText.isEmpty {
                if vm.allCoins.isEmpty {
                    loadingMessage
                } else {
                    emptyMessage
                }
            } else {
                ForEach(vm.portfolioCoins) { coin in
                    CoinRowView(coin: coin, showHoldingsColumn: true, showStar: vm.checkWatchList(coin: coin) ? true : false)
                        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                        .onTapGesture {
                            segue(coin: coin)
                        }
                }
                .alignmentGuide(.listRowSeparatorLeading) { _ in
                    0
                }
            }
            
            
        }
        .listStyle(PlainListStyle())
        .refreshable {
            vm.reloadCoinData()
        }
    }
    
    private var emptyMessage: some View {
        VStack(spacing: 4){
            Text("No coin in portfolio !")
                .font(.callout)
            Button {
                showPortfolioView.toggle()
            } label: {
                Text("Get Started")
                    .fontWeight(.semibold)
                    .frame(width: 320, height: 52)
                    .background(Color.theme.yellow)
                    .foregroundStyle(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.top, 6)
        }
        .frame(maxWidth: .infinity)
        .alignmentGuide(.listRowSeparatorLeading) { _ in
            -20
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
                Text("Holdings")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortCoinsOption == .holdings || vm.sortCoinsOption == .holdingsReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortCoinsOption == .holdings ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortCoinsOption = vm.sortCoinsOption == .holdings ? .holdingsReversed : .holdings
                }
            }
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
