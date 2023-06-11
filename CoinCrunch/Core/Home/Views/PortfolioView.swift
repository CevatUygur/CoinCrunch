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
    
    var body: some View {
        portfolioBodyView
            .tabItem {
                Label("Portfolio", systemImage: "chart.pie")
                    .accessibilityLabel("Portfolio")
            }
            .navigationBarTitleDisplayMode(.inline)
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
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    EditPortfolioView()
                        .environmentObject(vm)
                }
            
            // content layer
            VStack {
                profileHeader
                
                HomeStatsView()
                    .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
               
                SearchBarView(searchText: $vm.searchText)
                columnTitles
                
                portfolioCoinsList
                
                Spacer(minLength: 0)
            }
        }
        .background(
            NavigationLink(isActive: $showDetailView, destination: {
                CoinDetailLoadingView(coin: $selectedCoin)
            }, label: { EmptyView() })
        )
    }
    
    private var profileHeader: some View {
        HStack {
            Text("Portfolio")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "plus")
                .onTapGesture {
                    showPortfolioView.toggle()
                }
        }
        .padding(.horizontal)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
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
